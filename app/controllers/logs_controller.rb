class LogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]
  before_action :set_exhibition, only: [:create]
  before_action :set_log, only: [:show, :edit, :update, :destroy]

  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.all
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
  end

  # GET /logs/new
  def new
    @title = "投稿ページ｜アート・展覧会の口コミなら【doodo】"
    @description = "アート・展覧会の口コミサイト「doodo」の投稿ページです。ログインすることで、アート・絵画・美術館・展覧会・美術展の口コミを投稿することができます。六本木、国立新美術館、上野、国立西洋美術館など、各地で開催されている展覧会の最新情報もご案内。"

    if params[:museum_area].present? || params[:museum_name].present?
      museums = Museum.where("address LIKE ?", "%#{params[:museum_area]}%").where("name LIKE ?", "%#{params[:museum_name]}%")
      @museums = museums.sort do |a,b|
        if !a.exhibitions.last.star.present?
          1
        elsif !b.exhibitions.last.star.present?
          -1
        else
          b <=> a
        end
      end
    else
      @museums = Museum.includes(:exhibitions).order("exhibitions.star DESC NULLS LAST")
    end
    @museums = @museums.select { |museum| museum.id != 1 }.first(24)

    if params[:any].present?
      @exhibitions = Exhibition.search_by_any(params).sort do |a,b|
        if !a.star.present?
          1
        elsif !b.star.present?
          -1
        else
          b <=> a
        end
      end
    elsif params[:exhb_area].present? || params[:exhb_name].present? || params[:exhb_date].present?
      @exhibitions = Exhibition.search_by(params).sort do |a,b|
        if !a.star.present?
          1
        elsif !b.star.present?
          -1
        else
          b <=> a
        end
      end
    else
      @exhibitions = Exhibition.order("star DESC NULLS LAST")
    end
    @exhibitions = @exhibitions.select { |exhb| exhb.id != 1 }.first(24)

    if params[:art_name].present? || params[:artist_name].present?
      arts = Art.search_by(params).first(24)
      @arts = arts.sort do |a,b|
        if !a.star.present?
          1
        elsif !b.star.present?
          -1
        else
          b <=> a
        end
      end
    else
      @arts = Art.order("star DESC NULLS LAST").first(24)
    end

  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs
  # POST /logs.json
  def create
    @exhb_log = ExhbLog.new(exhb_log_params)
    @exhb_log.user_id = current_user.id
    @exhb_log.exhibition_id = @exhibition.id

    @exhb_log.art_logs.each do |art_log|
      if (art_log.star == 0 || art_log.star.blank?) && (art_log.body.blank? && art_log.image.blank?)
        art_log.destroy
      else
        art_log.user_id = current_user.id
      end
    end

    if @exhb_log.save
      Exhibition.update_star_by(@exhb_log)
      Art.update_stars_by(@exhb_log.art_logs)
      redirect_to mypage_path
    else
      redirect_to new_exhibition_log_path
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    if @log.user == current_user
      @log.update(body: exhb_log_params[:body])
    end
    redirect_to session[:previous_url] || root_path
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to logs_url, notice: 'Log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = ExhbLog.find(params[:id])
    end

    def set_exhibition
      @exhibition = Exhibition.find(params[:exhibition_id])
    end

    # Only allow a list of trusted parameters through.
    def log_params
      params.fetch(:log, {})
    end

    def exhb_log_params
      params.fetch(:exhb_log, {}).permit(:star, :body, art_logs_attributes: [:art_id, :star, :body, :image])
    end
end

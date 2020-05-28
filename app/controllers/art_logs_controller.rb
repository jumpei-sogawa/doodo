class ArtLogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_art_log, only: [:show, :edit, :update, :destroy]
  before_action :set_art, only: [:new, :create]

  # GET /art_logs
  # GET /art_logs.json
  def index
    @art_logs = ArtLog.all
  end

  # GET /art_logs/1
  # GET /art_logs/1.json
  def show
    @title = "アート・展覧会の口コミなら【doodo】"
    @headline = "作品のログ"
    @art_log_comment = ArtLogComment.new
    @art_log_comments = @art_log.art_log_comments
    @art = @art_log.art
    @exhibition = @art.exhibition
    @museum = @exhibition.museum
  end

  # GET /art_logs/new
  def new
    @title = "投稿ページ｜アート・展覧会の口コミなら【doodo】"
    @description = "アート・展覧会の口コミサイト「doodo」の投稿ページです。ログインすることで、アート・絵画・美術館・展覧会・美術展の口コミを投稿することができます。六本木、国立新美術館、上野、国立西洋美術館など、各地で開催されている展覧会の最新情報もご案内。"
    @headline = "ログ投稿"
    @exhb_log = ExhbLog.new
    @exhb_log.art_logs.build
  end

  # GET /art_logs/1/edit
  def edit
  end

  # POST /art_logs
  # POST /art_logs.json
  def create
    @exhb_log = ExhbLog.new(exhb_log_params)
    @exhb_log.user_id = current_user.id
    @exhb_log.exhibition_id = 1

    @art_log = @exhb_log.art_logs.first
    @art_log.user_id = current_user.id

    if @exhb_log.save
      @art_log.art.update_star
      redirect_to mypage_path
    else
      redirect_to new_art_art_log_path
    end
  end

  # PATCH/PUT /art_logs/1
  # PATCH/PUT /art_logs/1.json
  def update
    @art_log.update(body: art_log_params[:body])
    redirect_to session[:previous_url] || root_path
  end

  # DELETE /art_logs/1
  # DELETE /art_logs/1.json
  def destroy
    if user_signed_in?
      if @art_log.user.id == current_user.id || current_user.email == "admin@doodo.jp"
        if @art_log.exhb_log.exhibition.id == 1
          @art_log.exhb_log.destroy
          @art_log.art.update_star
        else
          @art_log.destroy
          @art_log.art.update_star
        end
      end
    end
    redirect_to session[:previous_url] || root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art_log
      unless @art_log = ArtLog.find_by(id: params[:id])
        redirect_to "#{search_path}?t=art"
      end
    end

    def set_art
      @art = Art.find(params[:art_id])
    end

    # Only allow a list of trusted parameters through.
    def art_log_params
      params.fetch(:art_log, {})
    end

    def exhb_log_params
      params.fetch(:exhb_log, {}).permit(art_logs_attributes: [:art_id, :star, :body, :image])
    end
end

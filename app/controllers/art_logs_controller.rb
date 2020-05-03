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
    @title = "アート・展覧会の口コミなら【DooDoo】"
    @headline = "作品のログ"
    @art_log_comment = ArtLogComment.new
    @art_log_comments = @art_log.art_log_comments
    @art = @art_log.art
    @exhibition = @art.exhibition
    @museum = @exhibition.museum
  end

  # GET /art_logs/new
  def new
    @title = "投稿ページ｜アート・展覧会の口コミなら【DooDoo】"
    @description = "アート・展覧会の口コミサイト「DooDoo」の投稿ページです。ログインすることで、アート・絵画・美術館・展覧会・美術展の口コミを投稿することができます。六本木、国立新美術館、上野、国立西洋美術館など、各地で開催されている展覧会の最新情報もご案内。"
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
    respond_to do |format|
      if @art_log.update(art_log_params)
        format.html { redirect_to @art_log, notice: 'Art log was successfully updated.' }
        format.json { render :show, status: :ok, location: @art_log }
      else
        format.html { render :edit }
        format.json { render json: @art_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /art_logs/1
  # DELETE /art_logs/1.json
  def destroy
    @art_log.destroy
    respond_to do |format|
      format.html { redirect_to art_logs_url, notice: 'Art log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art_log
      @art_log = ArtLog.find(params[:id])
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

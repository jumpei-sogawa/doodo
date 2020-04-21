class ArtLogsController < ApplicationController
  before_action :set_art_log, only: [:show, :edit, :update, :destroy]

  # GET /art_logs
  # GET /art_logs.json
  def index
    @art_logs = ArtLog.all
  end

  # GET /art_logs/1
  # GET /art_logs/1.json
  def show
    @title = "アート・展覧会の口コミなら【stART】"
    @headline = "作品のログ"
    @art_log_comment = ArtLogComment.new
    @art_log_comments = @art_log.art_log_comments
    @art = @art_log.art
    @exhibition = @art.exhibition
    @museum = @exhibition.museum
  end

  # GET /art_logs/new
  def new
    @art_log = ArtLog.new
  end

  # GET /art_logs/1/edit
  def edit
  end

  # POST /art_logs
  # POST /art_logs.json
  def create
    @art_log = ArtLog.new(art_log_params)

    respond_to do |format|
      if @art_log.save
        format.html { redirect_to @art_log, notice: 'Art log was successfully created.' }
        format.json { render :show, status: :created, location: @art_log }
      else
        format.html { render :new }
        format.json { render json: @art_log.errors, status: :unprocessable_entity }
      end
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

    # Only allow a list of trusted parameters through.
    def art_log_params
      params.fetch(:art_log, {})
    end
end

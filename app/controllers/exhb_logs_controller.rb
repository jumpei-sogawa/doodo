class ExhbLogsController < ApplicationController
  before_action :set_exhb_log, only: [:show, :edit, :update, :destroy]

  # GET /exhb_logs
  # GET /exhb_logs.json
  def index
    @exhb_logs = ExhbLog.all
  end

  # GET /exhb_logs/1
  # GET /exhb_logs/1.json
  def show
    @title = "展覧会のログ"
    @exhb_log_comment = ExhbLogComment.new
    @exhb_log_comments = @exhb_log.exhb_log_comments
    @exhibition = @exhb_log.exhibition
    @museum = @exhibition.museum
  end

  # GET /exhb_logs/new
  def new
    @exhb_log = ExhbLog.new
  end

  # GET /exhb_logs/1/edit
  def edit
  end

  # POST /exhb_logs
  # POST /exhb_logs.json
  def create
    @exhb_log = ExhbLog.new(exhb_log_params)

    respond_to do |format|
      if @exhb_log.save
        format.html { redirect_to @exhb_log, notice: 'Exhb log was successfully created.' }
        format.json { render :show, status: :created, location: @exhb_log }
      else
        format.html { render :new }
        format.json { render json: @exhb_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exhb_logs/1
  # PATCH/PUT /exhb_logs/1.json
  def update
    respond_to do |format|
      if @exhb_log.update(exhb_log_params)
        format.html { redirect_to @exhb_log, notice: 'Exhb log was successfully updated.' }
        format.json { render :show, status: :ok, location: @exhb_log }
      else
        format.html { render :edit }
        format.json { render json: @exhb_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exhb_logs/1
  # DELETE /exhb_logs/1.json
  def destroy
    @exhb_log.destroy
    respond_to do |format|
      format.html { redirect_to exhb_logs_url, notice: 'Exhb log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exhb_log
      @exhb_log = ExhbLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exhb_log_params
      params.fetch(:exhb_log, {})
    end
end

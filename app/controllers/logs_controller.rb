class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  before_action :set_exhibition, only: [:new, :create]

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
    @exhb_log = ExhbLog.new
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs
  # POST /logs.json
  def create
    @exhb_log = ExhbLog.new(exhb_log_params)
    @exhb_log.user = current_user
    @exhb_log.exhibition = @exhibition

    if @exhb_log.save
      redirect_to mypage_path
    else
      render :new
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to @log, notice: 'Log was successfully updated.' }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
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
      @log = Log.find(params[:id])
    end

    def set_exhibition
      @exhibition = Exhibition.find(params[:exhibition_id])
    end

    # Only allow a list of trusted parameters through.
    def log_params
      params.fetch(:log, {})
    end

    def exhb_log_params
      params.fetch(:exhb_log, {}).permit(:rate, :body)
    end
end

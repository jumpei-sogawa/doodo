class ExhibitionsController < ApplicationController
  before_action :set_exhibition, only: [:show, :edit, :update, :destroy]

  # GET /exhibitions
  # GET /exhibitions.json
  def index
    @search_params = search_params
    if search_params[:area].present? || search_params[:date].present?
      @exhibitions = Exhibition.search(search_params).sort { |a,b| b <=> a }
    else
      @exhibitions = Exhibition.all.order(star: "DESC")
    end
  end

  # GET /exhibitions/1
  # GET /exhibitions/1.json
  def show
    @arts = @exhibition.arts.where("star >= ?", 0).order(star: "DESC")
    @exhb_logs = @exhibition.exhb_logs.order(id: "DESC")
    @exhb_log_comment = ExhbLogComment.new
  end

  # GET /exhibitions/new
  def new
    @exhibition = Exhibition.new
  end

  # GET /exhibitions/1/edit
  def edit
  end

  # POST /exhibitions
  # POST /exhibitions.json
  def create
    @exhibition = Exhibition.new(exhibition_params)

    respond_to do |format|
      if @exhibition.save
        format.html { redirect_to @exhibition, notice: 'Exhibition was successfully created.' }
        format.json { render :show, status: :created, location: @exhibition }
      else
        format.html { render :new }
        format.json { render json: @exhibition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exhibitions/1
  # PATCH/PUT /exhibitions/1.json
  def update
    respond_to do |format|
      if @exhibition.update(exhibition_params)
        format.html { redirect_to @exhibition, notice: 'Exhibition was successfully updated.' }
        format.json { render :show, status: :ok, location: @exhibition }
      else
        format.html { render :edit }
        format.json { render json: @exhibition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exhibitions/1
  # DELETE /exhibitions/1.json
  def destroy
    @exhibition.destroy
    respond_to do |format|
      format.html { redirect_to exhibitions_url, notice: 'Exhibition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exhibition
      @exhibition = Exhibition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exhibition_params
      params.fetch(:exhibition, {})
    end

    def search_params
      params.fetch(:search, {}).permit(:area, :date)
    end
end

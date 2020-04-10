class MuseumsController < ApplicationController
  before_action :set_museum, only: [:show, :edit, :update, :destroy]

  # GET /museums
  # GET /museums.json
  def index
    if params[:area].present? || params[:name]
      @museums = Museum.where(["address LIKE ? AND name LIKE ?", "%#{params[:area]}%", "%#{params[:name]}%"])
    else
      @museums = Museum.all.includes(:exhibitions).order("exhibitions.star DESC")
    end
    @title = "美術館 #{@museums.count}件"
  end

  # GET /museums/1
  # GET /museums/1.json
  def show
    @title = "美術館 詳細"
    @exhibitions = @museum.exhibitions
  end

  # GET /museums/new
  def new
    @museum = Museum.new
  end

  # GET /museums/1/edit
  def edit
  end

  # POST /museums
  # POST /museums.json
  def create
    @museum = Museum.new(museum_params)

    respond_to do |format|
      if @museum.save
        format.html { redirect_to @museum, notice: 'Museum was successfully created.' }
        format.json { render :show, status: :created, location: @museum }
      else
        format.html { render :new }
        format.json { render json: @museum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /museums/1
  # PATCH/PUT /museums/1.json
  def update
    respond_to do |format|
      if @museum.update(museum_params)
        format.html { redirect_to @museum, notice: 'Museum was successfully updated.' }
        format.json { render :show, status: :ok, location: @museum }
      else
        format.html { render :edit }
        format.json { render json: @museum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /museums/1
  # DELETE /museums/1.json
  def destroy
    @museum.destroy
    respond_to do |format|
      format.html { redirect_to museums_url, notice: 'Museum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_museum
      @museum = Museum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def museum_params
      params.fetch(:museum, {})
    end
end

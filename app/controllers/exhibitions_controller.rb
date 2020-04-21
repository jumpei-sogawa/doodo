class ExhibitionsController < ApplicationController
  before_action :set_exhibition, only: [:show, :edit, :update, :destroy]

  # GET /exhibitions
  # GET /exhibitions.json
  def index
    if params[:any].present?
      @exhibitions = Exhibition.search_any(params).sort do |a,b|
        if !a.star.present?
          1
        elsif !b.star.present?
          -1
        else
          b <=> a
        end
      end
    elsif params[:area].present? || params[:name].present? || params[:date].present?
      @exhibitions = Exhibition.search(params).sort do |a,b|
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
    @exhibitions = @exhibitions.select { |exhb| exhb.id != 1 }
    @title = "展覧会 #{@exhibitions.count}件"
  end

  # GET /exhibitions/1
  # GET /exhibitions/1.json
  def show
    if @exhibition.id == 1
      redirect_to exhibitions_path
    end
    @title = "展覧会 詳細"
    @arts = @exhibition.arts.where("star >= ?", 0).order("star DESC NULLS LAST")
    @exhb_logs = @exhibition.exhb_logs.order(id: "DESC").first(10)
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

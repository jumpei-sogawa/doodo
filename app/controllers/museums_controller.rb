class MuseumsController < ApplicationController
  before_action :set_museum, only: [:show, :edit, :update, :destroy]

  # GET /museums
  # GET /museums.json
  def index
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
    @museums = @museums.select { |museum| museum.id != 1 }

    @title = "美術館検索ページ | アート・展覧会の口コミなら【stART】"
    @description = "アート・展覧会の口コミサイト「stART」の美術館検索ページです。stARTはアート・絵画・美術館・展覧会・美術展の口コミが見れる検索サイトです。六本木、国立新美術館、上野、国立西洋美術館など、各地で開催されている展覧会の最新情報をご案内。"
    @headline = "美術館 #{@museums.count}件"
  end

  # GET /museums/1
  # GET /museums/1.json
  def show
    if @museum.id == 1
      redirect_to museums_path
    end
    @title = @museum.title
    @description = @museum.description
    @headline = "美術館 詳細"
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

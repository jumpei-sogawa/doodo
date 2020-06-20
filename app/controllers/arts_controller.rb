class ArtsController < ApplicationController
  before_action :set_art, only: [:show, :edit, :update, :destroy]

  # GET /arts
  # GET /arts.json
  def index
    arts = Art.search_by(params).first(20)
    @arts = arts.sort do |a,b|
      if !a.star.present?
        1
      elsif !b.star.present?
        -1
      else
        b <=> a
      end
    end

    @title = "作品検索ページ | アート・展覧会の感想を見るなら【doodo】"
    @description = "アート・展覧会の感想まとめサイト「doodo」の作品検索ページです。doodoはアート・絵画・美術館・展覧会・美術展の口コミが見れる検索サイトです。六本木、国立新美術館、上野、国立西洋美術館など、各地で開催されている展覧会の最新情報をご案内。"
  end

  # GET /arts/1
  # GET /arts/1.json
  def show
    @title = @art.title
    @description = @art.description
    @art_logs = @art.art_logs.order(id: "DESC").select{|el| (el.body.present? || el.image.present? ) }.first(10)
    @art_log_comment = ArtLogComment.new
  end

  # GET /arts/new
  def new
    @art = Art.new
  end

  # GET /arts/1/edit
  def edit
  end

  # POST /arts
  # POST /arts.json
  def create
    @art = Art.new(art_params)

    respond_to do |format|
      if @art.save
        format.html { redirect_to @art, notice: 'Art was successfully created.' }
        format.json { render :show, status: :created, location: @art }
      else
        format.html { render :new }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arts/1
  # PATCH/PUT /arts/1.json
  def update
    respond_to do |format|
      if @art.update(art_params)
        format.html { redirect_to @art, notice: 'Art was successfully updated.' }
        format.json { render :show, status: :ok, location: @art }
      else
        format.html { render :edit }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arts/1
  # DELETE /arts/1.json
  def destroy
    @art.destroy
    respond_to do |format|
      format.html { redirect_to arts_url, notice: 'Art was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art
      unless @art = Art.find_by(id: params[:id])
        redirect_to "#{search_path}?t=art"
      end
    end

    # Only allow a list of trusted parameters through.
    def art_params
      params.fetch(:art, {})
    end
end

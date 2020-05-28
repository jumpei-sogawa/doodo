class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :publish, :unpublish]
  before_action :auth_admin, except: [:index, :show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.where(published: true).order(id: "DESC")
  end

  def admin_index
    @articles = Article.all.order(id: "DESC")
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    if !user_signed_in? || (user_signed_in? && current_user.email != "admin@doodo.jp")
      if !@article.published
        redirect_to articles_path
      end
    end
    @title = "#{@article.title}｜アートの口コミサイト【doodo】"
    @description = @article.description
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_admin_path
    else
      redirect_to new_article_path
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if @article.update(article_params)
      redirect_to articles_admin_path
    else
      redirect_to new_article_path
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    redirect_to articles_admin_path
  end

  def publish
    @article.update(published: true)
    redirect_to session[:previous_url] || root_path
  end

  def unpublish
    @article.update(published: false)
    redirect_to session[:previous_url] || root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:image, :title, :body, :description, :published)
    end

    def auth_admin
      if !user_signed_in? || current_user.email != "admin@doodo.jp"
        redirect_to articles_path
      end
    end
end

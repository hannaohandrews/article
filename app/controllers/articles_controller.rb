class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article #redirect_to will cause the browser to make a new request. This needs to happen after mutating the databse or the app state
    else
      render :new, status: :unprocessable_entity
      #render renders the speficed view for the current request
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity #unprocessable_entity is a 422 status code
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other #see_other is a 303 status code
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end

# The index action retrieves all articles from the database and stores them in the @articles instance variable.
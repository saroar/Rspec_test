class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:sucess] = 'Article has beed created'
      redirect_to articles_path
    else
      flash.now[:danger] = 'Article has not beed created'
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end

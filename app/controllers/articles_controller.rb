class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show

  end

  def edit
    if @article.user != current_user
      flash[:danger] = "You can only edit your own article."
      redirect_to root_path
    end
  end

  def update
    if @article.user != current_user
      flash[:danger] = "You can only edit your own article."
      redirect_to root_path
    else
      if @article.update(article_params)
        flash[:sucess] = 'Article has been updated'
        redirect_to @article
      else
        flash.now[:danger] = "Article has not been updated"
        render :edit
      end
    end
  end

  def destroy


    if @article.destroy
      flash[:sucess] = "Article has been deleted"
      redirect_to articles_path
    end
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:sucess] = 'Article has beed created'
      redirect_to articles_path
    else
      flash.now[:danger] = 'Article has not beed created'
      render :new
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end

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
    @article = Article.new()
    @article.title = params[:article][:title]
    @article.body = params[:article][:body]
    @article.save

    flash.notice = "Article #{@article.title} created!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Article #{@article.title} deleted!"

    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.title = params[:article][:title]
    @article.body = params[:article][:body]
    @article.send(:update)

    flash.notice = "Article #{@article.title} Updated!"

    redirect_to article_path(@article)
  end

  def article_params # broken
    params.require(:article).permit(:title, :body)
  end
end

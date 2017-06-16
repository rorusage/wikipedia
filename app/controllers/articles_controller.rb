class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_category, only:[:new, :create, :show, :edit, :update, :destroy]
  def new
    @article = @category.articles.new
  end

  def create
    @article = @category.articles.build(article_params)

    if @article.save
      @article.author = current_user
      @article.has_this_editor!(current_user)
      redirect_to category_path(@category), notice: "新增文章成功"
    else
      render :new
    end
  end

  def show
    @article = @category.articles.find(params[:id])
  end

  def edit
    @article = @category.articles.find(params[:id])
  end

  def update
    @article = @category.articles.find(params[:id])

    if @article.update(article_params)
      @article.has_this_editor!(current_user)
      redirect_to category_article_path(@category, @article), alert: "修改文章成功"
    else
      render :edit
    end
  end

  def destroy
    @article = @category.articles.find(params[:id])
    @article.destroy
    redirect_to categories_path(@category), alert: "刪除文章成功"
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_category
    @category = Category.find(params[:category_id])
  end
end

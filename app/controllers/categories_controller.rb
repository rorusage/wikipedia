class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_category, only: [:edit, :update, :destroy]
  def index
      @categories = Category.all
      @articles = Article.all.order("updated_at DESC")
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      redirect_to categories_path, notice: "新增類別成功"
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.all
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category, alert: "更新類別成功"
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path, alert: "刪除類別成功"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = current_user.categories.find(params[:id])
  end
end

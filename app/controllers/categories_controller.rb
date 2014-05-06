class CategoriesController < ApplicationController
  def index
    @categories = Category.scoped
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new(:parent_id => params[:parent_id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_url
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url
  end

  private

    def category_params
      params.require(:category).permit(:name, :parent_id, :ancestry)
    end
end

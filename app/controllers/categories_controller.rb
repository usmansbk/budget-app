class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_category, only: %i[show]

  def index
    @categories = current_user.categories
  end

  def show
    @deals = @category.deals.order(created_at: 'desc')
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to root_path, notice: 'Category was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Category was successfully deleted.' }
    end
  end

  private

  def set_category
    @category = Category.includes(:deals).find(params[:id])
  end

  def category_params
    params.fetch(:category, {}).permit(:name, :icon)
  end
end

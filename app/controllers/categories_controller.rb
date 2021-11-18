class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_category, only: %i[show]

  # GET /categories
  def index
    @categories = Category.all
  end

  # GET /categories/1
  def show; end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.fetch(:category, {})
  end
end

class DealsController < ApplicationController
  load_and_authorize_resource

  def new
    @deal = Deal.new
    set_categories
  end

  def create
    @deal = Deal.new(deal_params)
    @deal.author = current_user

    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal, notice: 'Transaction was successfully added.' }
      else
        set_categories
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_categories
    @categories = current_user.categories.map { |category| [category.name, category.id] }
  end

  def deal_params
    params.fetch(:deal, {}).permit(:name, :amount)
  end
end

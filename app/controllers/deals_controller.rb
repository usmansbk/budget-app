class DealsController < ApplicationController
  load_and_authorize_resource

  def index
    redirect_to categories_url
  end

  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(deal_params)
    @deal.author = current_user

    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal.categories.first, notice: 'Transaction was successfully added.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def deal_params
    params.fetch(:deal, {}).permit(:name, :amount, category_ids: [])
  end
end

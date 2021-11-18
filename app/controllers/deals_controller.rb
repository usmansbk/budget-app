class DealsController < ApplicationController
  load_and_authorize_resource

  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(deal_params)

    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def deal_params
    params.fetch(:deal, {})
  end
end

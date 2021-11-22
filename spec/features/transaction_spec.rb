require 'rails_helper'

RSpec.feature 'Transactions', type: :feature do
  login_user

  background do
    @category = FactoryBot.create(:category, user: @user)
    FactoryBot.build_list(:deal, 3, author: @user, category_ids: [@category.id])
  end

  scenario 'A list of transactions is presented' do
    visit category_path(@category)
    @category.deals.each do |deal|
      expect(page).to have_content deal.name
    end
  end

  scenario 'User could see the total amount for the category' do
    visit category_path(@category)
    expect(page).to have_content @category.total_amount
  end

  scenario 'There is an "Add a new transaction" button' do
    visit category_path(@category)
    click_link 'Add a new transaction'
    expect(page).to have_current_path(new_deal_path)
  end
end

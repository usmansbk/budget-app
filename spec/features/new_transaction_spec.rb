require 'rails_helper'

RSpec.feature 'NewTransactions', type: :feature do
  login_user

  background do
    @category = FactoryBot.create(:category, user: @user)
  end

  given(:deal) { FactoryBot.build(:deal) }

  scenario 'Creating a transaction with valid attributes' do
    visit new_deal_path
    within 'form' do
      fill_in 'Name', with: deal.name
      fill_in 'Amount', with: deal.amount
      select @category.name
    end
    click_button 'Save'
    expect(page).to have_current_path category_path(@category)
  end

  scenario 'Creating a transaction with invalid attributes' do
    visit new_deal_path
    within 'form' do
      fill_in 'Name', with: deal.name
      fill_in 'Amount', with: deal.amount
    end
    click_button 'Save'
    expect(page).to have_content "Categories can't be blank"
  end
end

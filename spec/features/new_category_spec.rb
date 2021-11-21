require 'rails_helper'

RSpec.feature 'NewCategories', type: :feature do
  login_user

  scenario 'Creating a category with valid attributes' do
    visit new_category_path
    within 'form' do
      fill_in 'Name', with: 'Mac donalds'
      fill_in 'Icon', with: 'https://placeholder.com'
    end
    click_button 'Save'
    expect(page).to have_current_path root_path
  end

  scenario 'Creating a category with invalid attributes' do
    visit new_category_path
    within 'form' do
      fill_in 'Name', with: 'Mac donalds'
      fill_in 'Icon', with: ''
    end
    click_button 'Save'
    expect(page).to have_content "Icon can't be blank"
  end
end

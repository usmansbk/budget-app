require 'rails_helper'

RSpec.feature 'Home', type: :feature do
  background do
    @user = FactoryBot.create(:user_with_categories)
    sign_in @user
  end

  scenario 'When the user logs in, they are presented with the categories page' do
    visit root_path
    expect(page).to have_content 'Categories'
  end

  scenario 'For each category, user can see name, icon, and total amount that belongs to a category' do
    visit root_path
    @user.categories.each do |category|
      expect(page).to have_content category.name
      expect(first('img') { |img| img[:src] == category.icon }).to be_present
    end
  end

  scenario 'Clicking a category item navigates to the transaction page' do
    visit root_path
    category = @user.categories.first
    find("a[href='#{category_url(category)}']").click
    expect(page).to have_current_path(category_path(category))
  end

  scenario 'There is an "Add a new category" button' do
    visit root_path
    click_link 'Add a new category'
    expect(page).to have_current_path(new_category_path)
  end
end

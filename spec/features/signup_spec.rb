require 'rails_helper'

RSpec.feature 'Signup', type: :feature do
  scenario 'Signing up as a new user' do
    visit new_user_registration_path
    within 'form' do
      fill_in 'Full Name', with: 'John Doe'
      fill_in 'Email', with: 'john_doe@example.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Confirm password', with: '12345678'
    end
    click_button 'Next'
    expect(page).to have_content 'You have signed up successfully.'
  end

  given(:other_user) { FactoryBot.create(:user) }

  scenario 'Signing up with existing email' do
    visit new_user_registration_path
    within 'form' do
      fill_in 'Full Name', with: 'John Doe'
      fill_in 'Email', with: other_user.email
      fill_in 'Password', with: '12345678'
      fill_in 'Confirm password', with: '12345678'
    end
    click_button 'Next'
    expect(page).to have_content 'Email has already been taken'
  end
end

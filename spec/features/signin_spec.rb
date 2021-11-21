require 'rails_helper'

RSpec.feature 'Signin', type: :feature do
  background do
    @user = FactoryBot.create(:user, password: '12345678')
  end

  scenario 'Signing in with correct credentials' do
    visit new_user_session_path
    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: '12345678'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'Signing in with invalid credentials' do
    visit new_user_session_path
    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: '1234567'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end

require 'rails_helper'

RSpec.feature 'Splash', type: :feature do
  scenario 'A simple welcome page' do
    visit root_path
    expect(page).to have_content 'MicroBudget'
  end
end

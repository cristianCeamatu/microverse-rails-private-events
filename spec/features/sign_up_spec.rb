require 'rails_helper'

RSpec.feature 'SignUps', type: :feature do
  scenario 'Users can create account' do
    visit sign_up_path

    fill_in 'user[name]', with: 'exampleUser'

    click_button 'Create user'

    expect(page).to have_content('User was successfully created and logged in.')
  end
end

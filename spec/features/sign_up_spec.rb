require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  before(:each) do
    @user = User.new(name: 'exampleUser')
    @user.save
  end

  scenario '' do
    visit sign_up_path

    fill_in 'user[name]', with: 'exampleUser'

    click_button 'Create user'

    expect(page).to have_content('User was successfully created and logged in.')
  end
end

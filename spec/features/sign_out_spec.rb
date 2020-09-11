require 'rails_helper'

RSpec.feature 'SignOuts', type: :feature do
  before(:each) do
    @user = User.new(name: 'exampleUser')
    @user.save
  end

  scenario 'they click on the sign out button and they sign out' do
    visit sign_in_path

    fill_in 'name', with: 'exampleUser'

    click_button 'Sign In'

    click_link 'Sign out'

    expect(page).to have_content('Succesfully logged out.')
  end
end

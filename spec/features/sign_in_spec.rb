require 'rails_helper'

RSpec.feature 'SignIns', type: :feature do
  before(:each) do
    @user = User.new(name: 'exampleUser')
    @user.save
  end
  scenario 'they access the home page and click the signup button' do
    visit sign_in_path

    fill_in 'name', with: 'exampleUser'

    click_button 'Sign in'

    expect(page).to have_content('exampleUser')
  end
end

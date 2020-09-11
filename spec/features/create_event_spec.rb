require 'rails_helper'

RSpec.feature "CreateEvents", type: :feature do
  before(:each) do
    @user = User.new(name: 'exampleUser', email: 'example@example.com')
    @user.save
  end
  scenario 'they access the home page and click the signup button' do
    visit login_path
    fill_in 'email', with: 'example@example.com'
    click_button 'Sign In'
    expect(page).to have_content('exampleUser')

    visit new_event_path
    expect(page).to have_content('New Event')

    fill_in 'event[name]', with: 'eventaboutsomething'
    fill_in 'event[description]', with: 'eventaboutsomethingeventaboutsomething'
    fill_in 'event[place]', with: 'Place in the world'
    fill_in 'event[date]', with: '2020-04-20'

    click_button 'Create'
    expect(page).to have_content('eventaboutsomething')

    click_link 'eventaboutsomething'
    expect(page).to have_content('eventaboutsomething')
  end
end

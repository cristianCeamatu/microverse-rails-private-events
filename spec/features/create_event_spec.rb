require 'rails_helper'

RSpec.feature "CreateEvents", type: :feature do
  before(:each) do
    @user = User.new(name: 'exampleUser')
    @user.save
  end
  scenario 'they can sign in and create events' do
    visit sign_in_path
    fill_in 'name', with: 'exampleUser'
    click_button 'Sign In'
    expect(page).to have_content('exampleUser')

    visit new_event_path
    expect(page).to have_content('New Event')

    fill_in 'event[description]', with: 'eventaboutsomethingeventaboutsomething'
    fill_in 'event[location]', with: 'Place in the world'
    fill_in 'event[date]', with: '2020-04-20'

    click_button 'Create Event'
    expect(page).to have_content('Place in the world')
  end
end

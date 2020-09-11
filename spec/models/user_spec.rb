require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'Yolo')
    @event1 = @user.created_events.create(date: '02.09.2030', location: 'Romania', description: 'Party')
    @event2 = @user.created_events.create(date: '02.09.2020', location: 'Bulgaria', description: 'Pijamas')
    @event_attended = @user.event_attendees.create(attended_event_id: @event1.id)
  end

  it 'can be created' do
    expect(User.first).to eq(@user)
  end

  it 'can create events' do
    expect(@user.created_events).to eq([@event1, @event2])
  end

  it 'can access the events' do
    expect(@user.reload.created_events.first).to eq(@event1)
  end

  it 'can attend events' do
    expect(@user.reload.event_attendees.first).to eq(@event_attended)
  end

  it 'can access the attend events' do
    expect(@user.reload.event_attendees).to eq([@event_attended])
  end
end

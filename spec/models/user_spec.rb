require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'Yolo')
    @event1 = @user.created_events.create(date: '02.09.2030', location: 'Romania', description: 'Party')
    @event2 = @user.created_events.create(date: '02.09.2020', location: 'Bulgaria', description: 'Pijamas')
    @event_attended = @user.event_attendees.create(attended_event_id: @event1.id)
  end

  context 'has associations' do
    it 'can be created' do
      expect(User.first).to eq(@user)
    end
  
    it 'can get the created events' do
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

  context 'has validations' do
    it 'should be valid' do
      assert @user.valid?
    end
  
    it 'should be not valid when :name above max size 20 characters' do
      @user.name = 'names' * 20
      @user.save
      expect(@user).to_not be_valid
    end

    it 'should be not valid when :name is nil' do
      @user.name = nil
      @user.save
      expect(@user).to_not be_valid
    end
  end
end

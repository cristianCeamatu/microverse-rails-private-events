require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @user = User.create(name: 'Yolo')
    @event1 = @user.created_events.create(date: '02.09.2030', location: 'Romania', description: 'Party')
    @event2 = @user.created_events.create(date: '02.09.2020', location: 'Bulgaria', description: 'Pijamas')
    @event_attended = @user.event_attendees.create(attended_event_id: @event1.id)
  end

  context 'has associations' do
    it 'can be created' do
      expect(Event.first).to eq(@event1)
    end
  
    it 'can get his creator' do
      expect(@event1.creator).to eq(@user)
    end
  
    it 'can get all the attendees' do
      expect(@event1.attendees).to eq([@user])
    end
  end
  
  context 'has validations' do
    it 'should be valid if the complete Event setup is valid' do
      assert @event1.valid?
    end
  
    it 'should not be valid if event:location is nil' do
      @event1.location = nil
      expect(@event1).to_not be_valid
    end
  
    it 'should not be valid if event:location is below min length of 5' do
      @event1.location = 'xxx'
      expect(@event1).to_not be_valid
    end

    it 'should not be valid if event:description is nil' do
      @event1.description = nil
      expect(@event1).to_not be_valid
    end
  
    it 'should not be valid if event:description is below min length of 5' do
      @event1.description = 'xxx'
      expect(@event1).to_not be_valid
    end

    it 'should not be valid if event:date is nil' do
      @event1.date = nil
      expect(@event1).to_not be_valid
    end
  
    # it 'should be valid if event:description is nil' do
    #   @event.description = nil
    #   @event.save
    #   expect(@event).to_not be_valid
    # end
  
    # it 'should be valid if event:description is below min length' do
    #   @event.description = 'xxx'
    #   @event.save
    #   expect(@event).to_not be_valid
    # end
  
    # it 'should be valid if event:place is nil' do
    #   @event.place = nil
    #   @event.save
    #   expect(@event).to_not be_valid
    # end
  
    # it 'should be valid if event:place is below min length' do
    #   @event.place = 'xxx'
    #   @event.save
    #   expect(@event).to_not be_valid
    # end
  
    # it 'should be valid if event:date is nil' do
    #   @event.date = nil
    #   @event.save
    #   expect(@event).to_not be_valid
    # end
  end
end

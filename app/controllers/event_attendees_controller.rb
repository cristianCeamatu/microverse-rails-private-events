class EventAttendeesController < ApplicationController
  def create
    @event_attendee = EventAttendee.new(attended_event_id: event_attendee_params['event_id'], event_attendee_id: current_user.id) # rubocop: disable Layout/LineLength

    redirect_to events_path, notice: 'Attendee successfully created.' if @event_attendee.save
  end

  private

  def event_attendee_params
    params.require(:event_attendee).permit(:event_id)
  end
end

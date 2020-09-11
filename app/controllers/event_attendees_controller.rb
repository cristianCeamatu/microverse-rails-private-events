class EventAttendeesController < ApplicationController
  def create
    @event_attendee = EventAttendee.new(attended_event_id: event_attendee_params['event_id'], event_attendee_id: session[:user_id])

    if @event_attendee.save
      redirect_to events_path, notice: 'Attendee successfully created.'
    end
  end

  private

  def event_attendee_params
    params.require(:event_attendee).permit(:event_id)
  end
end

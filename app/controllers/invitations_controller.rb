class InvitationsController < ApplicationController

  def new
  end

  def create
    event = Event.find(invitation_params[:attended_event_id])
    event.invitations.build(attendee_id: invitation_params[:attendee_id])
    if event.save
      redirect_to event
    else
      render "new"
    end
  end

  private

    def invitation_params
      params.require(:invitation).permit(:attended_event_id, :attendee_id)
    end

end

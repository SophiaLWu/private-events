class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = 'Event successfully created'
    else
      render 'new'
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  private

    def event_params
      params.require(:event).permit(:title, :description)
    end
end

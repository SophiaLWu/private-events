class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  
  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = 'Event successfully created'
      @event.attendees << current_user
      redirect_to current_user
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
      params.require(:event).permit(:title, :date, :location, :description)
    end
end

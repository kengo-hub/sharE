class Admins::EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.page(params[:page])
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to admins_events_path
    tag_list = params[:tag_name].split(",")
    if @event.save
      @event.save_events(tag_list)
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    redirect_to admins_events_path(event)
  end
    
  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to admins_events_path
  end
  
  def event_params
    params.require(:event).permit(:name, :event_date, :venue_id, :artist_id)
  end
  
end

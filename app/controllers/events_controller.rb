class EventsController < ApplicationController
  def new
  end

  def list
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to @event
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:title, :text, :time)
  end
end

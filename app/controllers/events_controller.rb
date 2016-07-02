class EventsController < ApplicationController
  def new
  end

  def index
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

  def subscribe
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:title, :text, :time).merge(:tag => create_tag)
  end

  def create_tag
    raw = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
    result = (0...16).map { raw[rand(raw.length)] }.join
  end
end

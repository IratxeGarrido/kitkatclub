class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_event, only: %i[show edit update destroy]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @organiser = Organiser.find(params[:organiser_id])
  end

  def create
    @event = Event.new(event_params)
    @organiser = Organiser.find(params[:organiser_id])
    if @event.save
      redirect_to oraganiser_path(@organiser), notice: 'Event was successfully created.'
    else
      render :new, status: :unprocesable_entity
    end
  end

  def update
    @organiser_id = @event.organiser
    @event.update(event_params)
    redirect_to organiser_events_path(@organiser_id), notice: 'Event was successfully created.'
  end

  def destroy
    @organiser_id = @event.organiser
    @event.destroy
    redirect_to organiser_events_path(@organiser_id)
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :start_date, :end_date, :recurring, :line_up, :style, :special, :dresscode)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end

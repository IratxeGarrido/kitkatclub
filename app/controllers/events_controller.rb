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
    on = params[:event][:recurrence][:on].shift.to_sym
    @event = Event.new(event_params)
    @event.organiser = Organiser.find(params[:organiser_id])
    if @event.save!
      redirect_to [@organiser, @event], notice: 'Event was successfully created.'
    else
      render :new, status: :unprocessable_entity
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
    params.require(:event).permit(
      :title,
      :location,
      :line_up,
      :style,
      :special,
      :dresscode,
      recurrence: [:every, :interval, :total, :at, :starts, :until, on: []]
    )
  end

  def set_event
    @event = Event.find(params[:id])
  end
end

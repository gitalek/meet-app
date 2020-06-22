class EventsController < ApplicationController
  before_action :find_event, only: %i[show edit update destroy]

  def index
    @events = Event.order(start_time: :desc).page(params[:page])
  end

  def show; end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    redirect_to @event
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end

  end

  def destroy
    @event.destroy
    byebug
    redirect_to events_path
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event)
      .permit(
        :title, :description, :location, :start_time,
        :end_time, :organizer_email, :organizer_telegram, :link,
      )
  end
end

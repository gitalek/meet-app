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

    if @event.save
      # redirect_to @event, notice: 'Event was created!'
      redirect_to @event, notice: (t 'notice.create')
    else
      flash.now[:error] = t 'flash.error_on_create'
      render :new
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      # redirect_to @event, notice: 'Successfully updated!'
      redirect_to @event, notice: (t 'notice.update')
    else
      # [!?] Duplicate
      # flash.now[:error] = 'Something went wrong... Try again'
      flash.now[:error] = t 'flash.error_on_update'
      render :edit
    end
  end

  def destroy
    @event.destroy
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
            :end_time, :organizer_email, :organizer_telegram, :link
          )
  end
end

class EventsController < ApplicationController
  before_action :require_login
  before_action :require_instructor, only: [:new, :create]
  before_action :set_event, only: [:show, :destroy]  

  def index
    @events = Event.all 
  end

  def new 
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = 'Event created successfully'
      redirect_to @event
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    if @event.destroy
      flash[:success] = "Event deleted."
      redirect_to events_path
    else
      flash[:alert] = "Could not delete event."
      redirect_to @event
    end
  end

  private 

  def set_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Event not found"
    redirect_to events_path
  end


  def event_params
    params.require(:event).permit(:title, :description, :date)
  end

  def require_instructor
    unless current_user.instructor?
      flash[:alert] = "Only instructors can create events"
      redirect_to events_path
    end
  end

end

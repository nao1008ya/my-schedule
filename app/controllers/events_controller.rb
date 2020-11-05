class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  def create
    Event.create(event_params)
    redirect_to root_path
  end

  def show
  end

  def edit
  end
  def update
    if @event.update(event_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @event.user.id == current_user.id
      @event.destroy
      redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end
end

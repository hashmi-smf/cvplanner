class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :delete, :destroy]
  respond_to :html, :js, :json

  def index
    @allevents = Event.all
    @events = Event.all
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)
    @event.save
    @event.update_attribute(:user_id, current_user.id)
  end

  def update
    @event.update_attributes(event_params)
  end

  def destroy 
    @event.destroy
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :start, :finish,
        :phone, :budget, :status,:all_day, :site_id, :user_id)
    end
end

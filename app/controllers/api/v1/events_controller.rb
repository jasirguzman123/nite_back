class Api::V1::EventsController < Api::V1::ApiController
  skip_before_action :set_current_user

  def index
    events
  end

  def show
    event
  end

  private

  def events
    @events ||= Event.active
  end

  def event
    @event ||= Event.active.find(params[:id])
  end
end

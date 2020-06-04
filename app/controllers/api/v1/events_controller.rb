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
    @events ||= Event.includes(:localities, :categories, :owner).with_attached_images.all.ransack(params[:q]).result
  end

  def event
    @event ||= Event.find(params[:id])
  end
end

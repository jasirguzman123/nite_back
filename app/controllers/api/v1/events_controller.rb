class Api::V1::EventsController < Api::V1::ApiController
  def index
    events_in_date
  end

  def show
    event
  end

  def create
    @event = @current_user.events.build(creation_params)
    return if @event.save

    render json: { errors: event.errors.full_messages }
  end

  private

  def events
    @events ||= Event.includes(:localities, :categories, :owner)
                     .with_attached_images.all.ransack(params[:q]).result
  end

  def events_in_date
    return events unless date.present?

    @events = events.where('date(starting_hour) = ?', date.to_date)
  end

  def date
    params[:date] || Date.today
  end

  def event
    @event ||= Event.find(params[:id])
  end

  def creation_params
    event_params.merge(
      images: params.dig(:images, '0')
    )
  end

  def event_params
    params.permit(
      :cover,
      :name,
      :address,
      :starting_hour,
      :ending_hour,
      :description,
      :latitude,
      :main_category,
      :longitude,
      images: []
    )
  end
end

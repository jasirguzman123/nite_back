json.data do
  json.partial! 'event', event: @event
  if @event.images.attached?
    json.images @event.images do |image|
      if Rails.env.production?
        json.url image.service_url
      else
        json.url Rails.application.routes.url_helpers.rails_blob_url(image)
      end
    end
  end
  json.participations @current_user.participations_in_event(@event) do |participation|
    json.partial! 'api/v1/event_participations/participation', participation: participation
  end
end

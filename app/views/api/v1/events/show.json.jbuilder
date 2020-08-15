json.data do
  json.partial! 'event', event: @event
  if @event.images.attached?
    json.images @event.images do |image|
      json.url image.service_url
    end
  end
  json.participations @current_user.participations_in_event(@event) do |participation|
    json.partial! 'api/v1/event_participations/participation', participation: participation
  end
end

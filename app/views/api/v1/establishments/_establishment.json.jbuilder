json.id establishment.id
json.name establishment.name
json.address establishment.address
json.categories establishment.categories do |category|
  json.partial! 'api/v1/event_participations/category', category: category
end
json.followers_count 12
json.events_count establishment.events.count
json.latitude establishment.latitude || 10.9839725
json.longitude establishment.longitude || -74.8880589

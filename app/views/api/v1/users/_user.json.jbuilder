json.id user.id
json.name user.name
json.last_name user.last_name
json.email user.email
json.phone user.phone
json.categories user.categories do |category|
  json.partial! 'api/v1/event_participations/category', category: category
end
json.events_count user.events.count
json.followers_count user.followers.count

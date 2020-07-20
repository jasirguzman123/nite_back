json.id owner.id
json.name owner.is_a?(User) ? owner.full_name : owner.name
json.followers_count owner.followers.count
json.events_count owner.events.count
json.categories owner.categories do |category|
  json.partial! 'api/v1/event_participations/category', category: category
end

json.id event.id
json.name event.name
json.address event.address
if event.owner_type == 'User'
  json.owner event.owner
else
  json.owner do
    json.partial! 'api/v1/establishments/establishment', establishment: event.owner
  end
end
json.owner_type event.owner_type
json.starting_hour event.starting_hour
json.ending_hour event.ending_hour
json.description event.description
json.categories event.categories do |category|
  json.partial! 'category', category: category
end
json.localities event.localities
json.starting_price event.starting_price
json.followers event.followers
json.images event.images do |image|
  json.url url_for(image)
end

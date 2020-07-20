json.id event.id
json.name event.name
json.address event.address
json.owner do
  json.partial! 'owner', owner: event.owner
end
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
json.latitude event.latitude || 10.9839725
json.longitude event.longitude || -74.8880589

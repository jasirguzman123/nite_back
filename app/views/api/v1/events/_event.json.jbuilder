json.id event.id
json.name event.name
json.address event.address
json.owner event.owner
json.starting_hour event.starting_hour
json.ending_hour event.ending_hour
json.description event.description
json.categories event.categories do |category|
  json.partial! 'category', category: category
end
json.localities event.localities
json.starting_price event.starting_price
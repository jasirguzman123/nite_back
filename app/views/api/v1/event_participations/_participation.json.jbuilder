json.nature participation.nature
json.event do
  json.partial! 'event', event: participation.event
end
json.locality participation.locality
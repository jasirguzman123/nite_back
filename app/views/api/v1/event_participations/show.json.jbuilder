json.partial! 'participation', participation: @participation
json.event do
  json.partial! 'event', event: @participation.event
end

json.data @participations do |participation|
  json.partial! 'participation', participation: participation
end
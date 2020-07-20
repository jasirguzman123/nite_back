json.data @establishments do |establishment|
  json.partial! 'establishment', establishment: establishment
end

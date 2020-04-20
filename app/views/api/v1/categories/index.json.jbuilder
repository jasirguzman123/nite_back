json.data Category.all do |category|
  json.id category.id
  json.name category.name
  json.color category.color&.gsub('#', '0xff')
end
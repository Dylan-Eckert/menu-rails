json.array! @menu_items do |menu_item|
  json.name menu_item.name
  json.id menu_item.id
  json.description menu_item.description
  json.price menu_item.price
end

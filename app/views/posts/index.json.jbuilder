json.array! @posts do |post|
  json.id post.id
  json.shopname post.shopname
end

json.array! @posts do |post|
  json.id post.id
  json.image post.image
  json.couponcode post.couponcode
  json.shopname post.shopname
  json.address post.address
  json.expirydate post.expirydate
  json.created_at post.created_at
  json.updated_at post.updated_at
  json.user_id post.user_id
end
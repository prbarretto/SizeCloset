json.array!(@closets) do |closet|
  json.extract! closet, :id, :store, :category, :size, :style, :note
  json.url closet_url(closet, format: :json)
end

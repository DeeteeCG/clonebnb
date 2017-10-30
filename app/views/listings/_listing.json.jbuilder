json.extract! listing, :id, :user_id, :title, :description, :property_type, :num_of_rooms, :num_of_bathrooms, :price, :created_at, :updated_at
json.url listing_url(listing, format: :json)

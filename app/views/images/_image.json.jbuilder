json.extract! image, :id, :imageUrl, :document_id, :created_at, :updated_at
json.url image_url(image, format: :json)
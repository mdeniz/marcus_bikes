json.extract! product, :id, :uuid, :brand, :model, :description, :price, :image, :year, :enabled, :stock_available, :customizable, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)

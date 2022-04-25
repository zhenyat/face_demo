json.extract! coin, :id, :name, :code, :kind, :unicode, :status, :created_at, :updated_at
json.url coin_url(coin, format: :json)

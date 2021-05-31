json.extract! plug, :id, :name, :amount, :created_at, :updated_at
json.url plug_url(plug, format: :json)

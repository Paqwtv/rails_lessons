json.extract! card, :id, :number, :type, :code, :profile, :created_at, :updated_at
json.url card_url(card, format: :json)

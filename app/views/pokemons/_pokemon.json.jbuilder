json.extract! pokemon, :id, :number, :title, :type, :image, :gender, :slug, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)

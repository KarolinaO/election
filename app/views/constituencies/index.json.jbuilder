json.array!(@constituencies) do |constituency|
  json.extract! constituency, :id
  json.url constituency_url(constituency, format: :json)
end

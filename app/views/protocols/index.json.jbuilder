json.array!(@protocols) do |protocol|
  json.extract! protocol, :name, :sex, :lowage, :highage, :problems, :medications, :tests, :fact, :numer, :denom, :score
  json.url protocol_url(protocol, format: :json)
end
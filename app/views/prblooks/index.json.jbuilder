json.array!(@prblooks) do |prblook|
  json.extract! prblook, :description, :longdescr, :mlcode, :keyword, :codetype, :standard
  json.url prblook_url(prblook, format: :json)
end
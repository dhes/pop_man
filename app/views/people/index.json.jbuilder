json.array!(@people) do |person|
  json.extract! person, :pid, :searchname, :dateofbirth
  json.url person_url(person, format: :json)
end
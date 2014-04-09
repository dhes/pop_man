json.array!(@chrtrules) do |chrtrule|
  json.extract! chrtrule, :name, :rulecomment
  json.url chrtrule_url(chrtrule, format: :json)
end
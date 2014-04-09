json.array!(@preventive_services) do |preventive_service|
  json.extract! preventive_service, :source, :name, :rule, :in_scope, :implemented
  json.url preventive_service_url(preventive_service, format: :json)
end
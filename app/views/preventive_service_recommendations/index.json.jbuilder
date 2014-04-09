json.array!(@preventive_service_recommendations) do |preventive_service_recommendation|
  json.extract! preventive_service_recommendation, :title, :description, :source, :in_scope?, :implemented?
  json.url preventive_service_recommendation_url(preventive_service_recommendation, format: :json)
end
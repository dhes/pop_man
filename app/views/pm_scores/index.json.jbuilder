json.array!(@pm_scores) do |pm_score|
  json.extract! pm_score, :measure, :score, :score_date, :numer, :denom
  json.url pm_score_url(pm_score, format: :json)
end
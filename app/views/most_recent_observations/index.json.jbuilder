json.array!(@most_recent_observations) do |most_recent_observation|
  json.extract! most_recent_observation, :pid, :hdid, :obsdate, :obsvalue
  json.url most_recent_observation_url(most_recent_observation, format: :json)
end
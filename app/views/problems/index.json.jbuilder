json.array!(@problems) do |problem|
  json.extract! problem, :pid, :code
  json.url problem_url(problem, format: :json)
end
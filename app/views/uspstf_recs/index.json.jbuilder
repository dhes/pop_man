json.array!(@uspstf_recs) do |uspstf_rec|
  json.extract! uspstf_rec, :topic, :description, :grade, :release_date, :in_scope, :reminder_implemented, :score_implemented
  json.url uspstf_rec_url(uspstf_rec, format: :json)
end
json.array!(@diabetes_patients) do |diabetes_patient|
  json.extract! diabetes_patient, :oracle_id
  json.url diabetes_patient_url(diabetes_patient, format: :json)
end
json.array!(@hes_patients) do |hes_patient|
  json.extract! hes_patient, :name, :age, :gender, :last_seen
  json.url hes_patient_url(hes_patient, format: :json)
end
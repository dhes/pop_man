json.array!(@dhes_patients) do |dhes_patient|
  json.extract! dhes_patient, :pid, :searchname, :age_months, :sex, :last_seen
  json.url dhes_patient_url(dhes_patient, format: :json)
end
json.array!(@clinical_rules) do |clinical_rule|
  json.extract! clinical_rule, :name, :sex, :lowage, :highage, :problem, :medication, :allergy, :test, :comment
  json.url clinical_rule_url(clinical_rule, format: :json)
end
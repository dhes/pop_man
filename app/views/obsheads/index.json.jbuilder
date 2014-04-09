json.array!(@obsheads) do |obshead|
  json.extract! obshead, :hdid, :name, :description, :mlcode, :cptcode, :icdcode, :loinccode, :snomedcode
  json.url obshead_url(obshead, format: :json)
end
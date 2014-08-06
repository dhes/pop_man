json.array!(@rptobs) do |rptob|
  json.extract! rptob, :pid, :hdid, :obsdate, :obsvalue, :change
  json.url rptob_url(rptob, format: :json)
end
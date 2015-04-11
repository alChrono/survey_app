json.array!(@tests) do |test|
  json.extract! test, :id, :survey, :question
  json.url test_url(test, format: :json)
end

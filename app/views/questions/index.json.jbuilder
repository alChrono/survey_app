json.array!(@questions) do |question|
  json.extract! question, :id, :question, :answer_1, :answer_2, :answer_3, :answer_4, :answer_5
  json.url question_url(question, format: :json)
end

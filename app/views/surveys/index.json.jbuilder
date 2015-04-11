json.array!(@surveys) do |survey|
  json.extract! survey, :id, :name, :question_list
  json.url survey_url(survey, format: :json)
end

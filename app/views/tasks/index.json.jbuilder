json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :content, :due_date, :completed_on, :list_id
  json.url task_url(task, format: :json)
end

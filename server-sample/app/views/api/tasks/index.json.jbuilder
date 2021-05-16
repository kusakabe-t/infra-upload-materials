json.tasks do |task|
  json.extract! task, :id, :name, :is_done, :time
end
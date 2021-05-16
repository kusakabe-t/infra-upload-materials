json.post_times do |post_time|
  json.extract! post_time, :id, :time
end
json.array!(@sensors) do |sensor|
  json.extract! sensor, :id, :name, :value
  json.url sensor_url(sensor, format: :json)
end

json.array!(@writers) do |writer|
  json.extract! writer, :name, :book, :address
  json.url writer_url(writer, format: :json)
end

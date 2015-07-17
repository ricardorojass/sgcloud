json.array!(@documents) do |document|
  json.extract! document, :id, :code, :version, :details
  json.url document_url(document, format: :json)
end

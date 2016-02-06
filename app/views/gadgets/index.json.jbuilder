json.array!(@gadgets) do |gadget|
  json.extract! gadget, :id, :name, :avatars, :caption
  json.url gadget_url(gadget, format: :json)
end

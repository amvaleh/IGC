json.array!(@projects) do |project|
  json.extract! project, :id, :title, :client_name, :start_date, :contract_type, :location, :duration, :design_capacity, :construction_man_hour, :avatars
  json.url project_url(project, format: :json)
end

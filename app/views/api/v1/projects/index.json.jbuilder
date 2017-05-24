json.(@projects) do |project|
  json.(project, :title, :description, :image_url, :target_amount, :completion_date)
end

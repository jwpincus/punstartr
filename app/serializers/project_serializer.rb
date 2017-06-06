class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description,
             :image_url, :target_amount, :completion_date,
             :backers, :city, :country

  def backers
    object.project_backers.count
  end

  def city
    object.city.name
  end

  def country
    object.country.name
  end
end

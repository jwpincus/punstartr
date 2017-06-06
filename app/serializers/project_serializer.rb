class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image_url, :target_amount, :backers

  has_many :project_backers

  def backers
    object.project_backers.count
  end
end

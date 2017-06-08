class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :count

  def count
    object.projects.count
  end
end

class Category < ApplicationRecord
  has_many :projects

  def self.category_list
    all
  end

  def self.count_by_project
    joins(:projects).select("categories.*, COUNT(categories.id) AS cat_count").group(:id).order('cat_count DESC')
  end
end

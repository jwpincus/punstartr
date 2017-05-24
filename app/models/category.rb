class Category < ApplicationRecord
  has_many :projects

  def self.category_list
    all
  end
end

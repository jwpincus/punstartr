class Project < ApplicationRecord
  belongs_to :category, required: false
  has_many :rewards

end

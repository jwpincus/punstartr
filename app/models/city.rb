class City < ApplicationRecord
  has_many :projects
  belongs_to :country
end

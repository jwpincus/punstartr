class Country < ApplicationRecord
  has_many :projects
  has_many :cities

  def self.country_list
    all
  end
end

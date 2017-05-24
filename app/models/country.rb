class Country < ApplicationRecord
  has_many :projects

  def self.country_list
    all
  end
end

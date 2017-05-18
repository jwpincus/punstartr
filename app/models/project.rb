class Project < ApplicationRecord
  belongs_to :category, required: false
end

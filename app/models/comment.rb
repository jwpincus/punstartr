class Comment < ApplicationRecord
  validates :body, presence: true
  validates :project, presence: true

  belongs_to :user
  belongs_to :project
end

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :project

  enum vote_type: [:upvote, :downvote]
end

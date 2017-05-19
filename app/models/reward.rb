class Reward < ApplicationRecord
  belongs_to :project, optional: true
end

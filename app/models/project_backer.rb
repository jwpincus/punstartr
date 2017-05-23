class ProjectBacker < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :reward

  
end

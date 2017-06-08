class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true
  validates :email, uniqueness: true, case_sensitive: false
  validates :name, presence: true

  has_many :project_owners
  has_many :projects, through: :project_owners

  has_many :project_backers
  has_many :backed_projects, through: :project_backers, source: :project

  has_many :rewards, through: :project_backers

  has_many :votes, dependent: :destroy


  def owner?(project)
    projects.include?(project)
  end
end

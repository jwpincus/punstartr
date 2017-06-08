class Project < ApplicationRecord

 include ActionView::Helpers::NumberHelper
  belongs_to :city
  belongs_to :country
  belongs_to :category, required: false
  has_many   :project_owners
  has_many   :owners, through: :project_owners, source: :user
  has_many   :rewards
  has_many   :project_backers
  has_many   :backers, through: :project_backers, source: :user
  has_many   :votes, dependent: :destroy

  validates  :title,
             :description,
             :image_url,
             :target_amount,
             :category_id,
             :completion_date,
             presence: true

  validates :slug, uniqueness: true

  before_create :create_slug

  def create_slug
    self.slug = self.title.parameterize
  end

  def formatted_price
    number_to_currency(target_amount, unit: "$", format: "%u%n", precision: 0)
  end

  def end_date
    completion_date.strftime("%B %d, %Y")
  end

  def end_time
    completion_date.strftime("%l:%M %p")
  end

  def end_date_time
   "#{end_date} at #{end_time}"
  end

  def total_pledged
    self.project_backers.sum("pledge_amount")
  end

  def self.most_funded
    Project.joins(:project_backers).group(:id).order('sum(pledge_amount)desc').first
  end

  def days_remaining
   (Date.parse(end_date) - Date.today).to_s
  end

  def self.most_backers(limit)
    limit = 10 if limit.nil?
    joins(:project_backers)
      .select("projects.*, COUNT(project_backers.id) AS backer_count")
      .group(:id)
      .order('backer_count DESC')
      .limit(limit)
  end

  def self.ending_soon(limit)
    limit = 10 if limit.nil?
    order(completion_date: :desc).limit(limit)
  end

  def upvotes
    self.votes.where(vote_type: :upvote).count
  end
end

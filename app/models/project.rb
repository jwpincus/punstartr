class Project < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :category, required: false
  has_many :project_owners
  has_many :owners, through: :project_owners, source: :user
  has_many :project_backers
  has_many :backers, through: :project_backers, source: :user
  # anki this ^^ (soure: :users)

  has_many :rewards

  validates :title, :description, :image_url, :target_amount, :category_id, :completion_date, presence: true

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
end

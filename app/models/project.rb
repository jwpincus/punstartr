class Project < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :category, required: false
  has_many :rewards

  validates :title, :description, :image_url, :target_amount, :category_id, :completion_date, presence: true

  def project_amount(id)
    project = Project.find(id)
    project["target_amount"]
  end

  def format_price
    number_to_currency(project_amount(id), unit: "€", precision: 0, format: "%u %n")
  end
end

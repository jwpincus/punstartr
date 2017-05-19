class Project < ApplicationRecord
   include ActionView::Helpers::NumberHelper
  belongs_to :category, required: false
  has_many :rewards

  def project_amount(id)
    project = Project.find(id)
    project["target_amount"]
  end

  def format_price
    number_to_currency(project_amount(id), :unit => "€", precision: 0, format: "%u %n")
  end
end

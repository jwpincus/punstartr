class Reward < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :project, optional: true


  def price
    number_to_currency(pledge_amount, unit: "$", format: "%u%n", precision: 0)
  end


end

class AddCountryToProject < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :countries, foreign_key: true
  end
end

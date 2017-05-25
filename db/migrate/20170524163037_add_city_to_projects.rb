class AddCityToProjects < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :city, foreign_key: true
  end
end

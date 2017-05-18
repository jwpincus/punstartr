class AddCategoryToProjects < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :category, foreign_key: true
  end
end

class AddCompletionDateToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :completion_date, :datetime
  end
end

class ChangeProjectsTargetAmountToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :projects, :target_amount, :integer
  end
end

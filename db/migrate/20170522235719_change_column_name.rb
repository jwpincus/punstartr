class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :countries_id, :country_id
  end
end

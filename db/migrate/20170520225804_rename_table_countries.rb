class RenameTableCountries < ActiveRecord::Migration[5.0]
  def change
    rename_table "table_countries", "countries"
  end
end

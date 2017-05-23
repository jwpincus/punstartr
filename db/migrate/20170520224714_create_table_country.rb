class CreateTableCountry < ActiveRecord::Migration[5.0]
  def change
    create_table :table_countries do |t|
      t.string :name

      t.timestamps
    end
  end
end

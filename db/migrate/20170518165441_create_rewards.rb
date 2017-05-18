class CreateRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :rewards do |t|
      t.string :title
      t.text :description
      t.decimal :pledge_amount
      t.integer :limit
      t.references :project, foreign_key: true
    end
  end
end

class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.text :title
      t.text :description
      t.text :image_url
      t.decimal :target_amount

      t.timestamps
    end
  end
end

class CreateProjectBackers < ActiveRecord::Migration[5.0]
  def change
    create_table :project_backers do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.references :reward, foreign_key: true
      t.integer :pledge_amount

      t.timestamps
    end
  end
end

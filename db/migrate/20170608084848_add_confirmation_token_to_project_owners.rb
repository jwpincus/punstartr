class AddConfirmationTokenToProjectOwners < ActiveRecord::Migration[5.0]
  def change
    add_column :project_owners, :confirm_token, :string
    add_column :project_owners, :comfirmed, :boolean, default: :true
  end
end

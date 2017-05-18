class ChangeUserPassword < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :password_digest, :crypted_password
  end
end

class AddReferencesToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :chatroom, foreign_key: true
  end
end

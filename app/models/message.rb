class Message < ActiveRecord
  belongs_to :user
  belongs_to :chatroom
end

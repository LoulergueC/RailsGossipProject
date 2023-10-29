class User < ApplicationRecord
    belongs_to :city
    has_many :gossips

    has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
    has_many :received_messages, class_name: "JoinPrivateMessageReceiver", foreign_key: 'receiver_id'
end

class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :first_name, :last_name, presence: true

    belongs_to :city
    has_many :gossips
    has_many :comments

    has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
    has_many :received_messages, class_name: "JoinPrivateMessageReceiver", foreign_key: 'receiver_id'
end

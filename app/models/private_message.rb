class PrivateMessage < ApplicationRecord
    belongs_to :sender, class_name: "User"
    
    has_many :join_private_message_receivers
    has_many :receivers, class_name: "User", through: :join_private_message_receivers
end

class Comment < ApplicationRecord
    validates :content, presence: true
    
    belongs_to :gossip
    belongs_to :user
end

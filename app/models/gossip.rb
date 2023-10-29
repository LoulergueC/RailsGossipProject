class Gossip < ApplicationRecord
    belongs_to :user
    has_many :join_tags_gossips
    has_many :tags, through: :join_tags_gossips
end

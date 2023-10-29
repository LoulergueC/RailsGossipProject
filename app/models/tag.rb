class Tag < ApplicationRecord
    has_many :join_tags_gossips
    has_many :gossips, through: :join_tags_gossips
end

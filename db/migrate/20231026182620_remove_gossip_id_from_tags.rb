class RemoveGossipIdFromTags < ActiveRecord::Migration[7.1]
  def change
    remove_reference :tags, :gossip, foreign_key: true
  end
end

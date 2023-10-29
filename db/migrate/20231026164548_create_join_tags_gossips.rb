class CreateJoinTagsGossips < ActiveRecord::Migration[7.1]
  def change
    create_table :join_tags_gossips do |t|
      t.belongs_to :tag
      t.belongs_to :gossip
      t.timestamps
    end
  end
end

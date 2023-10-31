class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :gossip
      t.belongs_to :user

      t.timestamps
    end
  end
end

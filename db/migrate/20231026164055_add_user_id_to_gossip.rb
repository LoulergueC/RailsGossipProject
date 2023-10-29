class AddUserIdToGossip < ActiveRecord::Migration[7.1]
  def change
    add_reference :gossips, :user, foreign_key: true
  end
end

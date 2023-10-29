class CreateJoinPrivateMessageReceivers < ActiveRecord::Migration[7.1]
  def change
    create_table :join_private_message_receivers do |t|
      t.references :private_message, index: true
      t.references :receiver, index: true

      t.timestamps
    end
  end
end

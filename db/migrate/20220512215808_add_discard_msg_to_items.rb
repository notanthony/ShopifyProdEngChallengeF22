class AddDiscardMsgToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :discarded_msg, :string
  end
end

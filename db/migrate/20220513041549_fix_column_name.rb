class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :discarded_msg, :discarded_message
  end
end

class RenameMessagesCol < ActiveRecord::Migration
  def change
    rename_column :messages, :msg, :content
  end
end

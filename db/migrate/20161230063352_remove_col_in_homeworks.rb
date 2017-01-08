class RemoveColInHomeworks < ActiveRecord::Migration
  def change
    remove_column :homeworks, :topic
    remove_column :homeworks, :description
    remove_column :homeworks, :deadline
  end
end

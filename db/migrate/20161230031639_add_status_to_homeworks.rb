class AddStatusToHomeworks < ActiveRecord::Migration
  def change
    rename_column :homeworks, :handed_in, :status
    change_column :homeworks, :status, :integer
  end
end

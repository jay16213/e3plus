class AddStatusToHomeworks < ActiveRecord::Migration
  def change
    remove_column :homeworks, :handed_in
    add_column :homeworks, :status, :integer
  end
end

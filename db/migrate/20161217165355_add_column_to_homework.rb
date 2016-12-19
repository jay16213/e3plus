class AddColumnToHomework < ActiveRecord::Migration
  def change
    add_column :homeworks, :user_id, :integer
    add_column :homeworks, :deadline, :datetime
    add_column :homeworks, :handed_in, :boolean
    add_column :homeworks, :file, :string
  end
end

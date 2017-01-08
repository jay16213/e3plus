class AddAnnounseIdToHomework < ActiveRecord::Migration
  def change
    add_column :homeworks, :announce_id, :integer
  end
end

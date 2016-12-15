class ChangeAnnounceTagColumn < ActiveRecord::Migration
  def change
    rename_column :announces, :tag, :tag_id
    change_column :announces, :tag_id, :integer
  end
end

class ChangeAnnounceTagColumn < ActiveRecord::Migration
  def change
    rename_column :announces, :tag, :tag_id
    change_column :announces, :tag_id, :integer, 'integer USING CAST(:tag_id AS integer)'
  end
end

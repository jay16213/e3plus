class ChangeAnnounceTagColumn < ActiveRecord::Migration
  def change
    remove_column :announces, :tag
    add_column :announces, :tag_id, :integer
  end
end

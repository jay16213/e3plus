class CreateAnnounces < ActiveRecord::Migration
  def change
    create_table :announces do |t|
      t.string :tag
      t.string :topic
      t.text :content
      t.datetime :deadline

      t.timestamps null: false
    end
  end
end

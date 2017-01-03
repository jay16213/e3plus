class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.integer :course_id
      t.string :topic
      t.text :description

      t.timestamps null: false
    end
  end
end

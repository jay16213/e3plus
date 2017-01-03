class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :announce_id
      t.text :msg

      t.timestamps null: false
    end
  end
end

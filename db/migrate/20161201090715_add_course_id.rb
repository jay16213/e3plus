class AddCourseId < ActiveRecord::Migration
  def change
    add_column :announces, :course_id, :integer
  end
end

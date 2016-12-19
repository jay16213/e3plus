class Homework < ActiveRecord::Base
    
    #a course may has hws
    belongs_to :course

    #every student has hws
    belongs_to :user

    #upload hw files
    mount_uploader :file, HomeworkUploader
end

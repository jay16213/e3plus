class User < ActiveRecord::Base
    has_secure_password

    #many-to-many associations between users & courses
    has_many :user_courseships
    has_many :courses, :through => :user_courseships

    #one-to-many
    has_many :homeworks
end

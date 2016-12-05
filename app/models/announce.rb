class Announce < ActiveRecord::Base
    #one-to-many associations
    belongs_to :course

    validates_presence_of :course_id, :tag, :topic, :content
end

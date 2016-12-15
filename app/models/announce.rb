class Announce < ActiveRecord::Base
    #one-to-many associations
    belongs_to :course
    belongs_to :tag
    validates_presence_of :course_id, :tag_id, :topic, :content
    validates_presence_of :deadline, if: :exam_or_hw?

    def exam_or_hw?
        self.tag_id != 1
    end

end

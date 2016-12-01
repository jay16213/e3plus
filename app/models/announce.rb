class Announce < ActiveRecord::Base
    #one-to-many associations
    belongs_to :course
end

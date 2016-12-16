class Message < ActiveRecord::Base
    belongs_to :user
    belongs_to :announce

    has_many :replies, class_name: "Message", foreign_key: "message_id"
    belongs_to :message, class_name: "Message"
end

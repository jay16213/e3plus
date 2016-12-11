class TaController < AnnouncesController
    before_action :set_user_info
    #create a new empty message object
    before_action :new_msg, only: [ :index, :course ]

    def index
        #tag_id == 1 => general
        #tag_id == 2 => exam, tag_id == 3 => homework
        #general announce
        @generals = Announce.where(course_id: @courses, tag_id: 1).order("created_at desc")
        #exam announce
        @exams = Announce.where(course_id: @courses, tag_id: 2).order("created_at desc")
        #homework announce
        @homeworks = Announce.where(course_id: @courses, tag_id: 3).order("created_at desc")
    end

    def course
        @course = Course.find(params[:id])
        @announces = Announce.where(course_id: @course).order("created_at desc")
        #exam announce
        @exams = Announce.where(course_id: @course, tag_id: 2).order("created_at desc")
        #homework announce
        @homeworks = Announce.where(course_id: @course, tag_id: 3).order("created_at desc")
    end

    def create_msg#left message to the announce
        @message = Message.new(message_params)

        if @message.save
            redirect_to(:back)#redirect to current page
        else
            flash[:notice] = "系統錯誤，請稍後再試！"
        end
    end

    private

    def set_user_info
        @user = User.find(session[:user_id])
        @courses = @user.courses.all
        @announces = Announce.where(course_id: @courses).order("created_at desc")
    end

    def new_msg
        @message = Message.new
    end

    def message_params
        params.require(:message).permit(:user_id, :announce_id, :msg)
    end
end

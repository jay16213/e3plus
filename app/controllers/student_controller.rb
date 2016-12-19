class StudentController < AnnouncesController
    before_action :set_user_info
    
    def index
        @cards = Announce.where(course_id: @courses, tag_id: [2,3]).order("deadline")
    end

    # show announce which tag is general
    def general
    end

    def exam
    end

    def homework
    end

    def course
        @course = Course.find(params[:id])
    end

    private

    def set_user_info
        @user = User.find(session[:user_id])
        @courses = @user.courses.all
        @announces = Announce.where(course_id: @courses).order("created_at desc")
    end
end

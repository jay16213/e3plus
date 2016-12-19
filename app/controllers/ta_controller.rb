class TaController < AnnouncesController
    before_action :set_user_info

    def index
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

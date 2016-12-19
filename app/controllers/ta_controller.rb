class TaController < AnnouncesController
    before_action :set_user_info

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

    private

    def set_user_info
        @user = User.find(session[:user_id])
        @courses = @user.courses.all
        @announces = Announce.where(course_id: @courses).order("created_at desc")
    end
end

class AnnouncesController < ApplicationController
    before_action :set_announce, only: [ :show, :edit, :update, :destroy ]
    before_action :set_courses, only: [ :new, :create, :show, :edit, :update ]
    
    layout :determine

    def index
    end

    def show
        @cards = Announce.where(course_id: @courses, tag_id: [2,3]).order("deadline")
    end

    def new
        @announce = Announce.new
    end

    def create
        @announce = Announce.new(announce_params)
        if @announce.save
            #new hw
            if @announce.tag_id == 3#it is an hw announce
                @announce.course.users.each do |user|
                    if user.identity == "student"
                        hw = Homework.new( course: @announce.course, topic: @announce.topic, description: @announce.content, deadline: @announce.deadline, user: user)
                        hw.handed_in = false
                        hw.save
                    end
                end
            end

            redirect_to controller: 'ta', action: 'index'
        else
            flash[:notice] = '所有欄位皆為必填！'
            redirect_to :new_announce
        end
    end

    def edit
    end

    def update
        if @announce.update(announce_params)
            redirect_to controller: 'ta', action: 'index'
        else
            redirect_to action: 'edit'
        end
    end

    def destroy
        @announce.destroy
        redirect_to controller: 'ta', action: 'index'
    end

    private

    def set_announce
        @announce = Announce.find(params[:id])
    end

    def set_courses
        @courses = User.find(session[:user_id]).courses.all
    end

    #data validation
    def announce_params
      params.require(:announce).permit(:course_id, :tag_id, :topic, :content, :deadline)
    end

    def determine
        (User.find(session[:user_id]).identity == "student") ? 'student' : 'ta'
    end

end

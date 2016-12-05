class AnnouncesController < ApplicationController
    before_action :set_announce, only: [ :show, :edit, :update, :destroy ]
    before_action :set_courses, only: [ :new, :create, :edit, :update ]

    layout 'ta'
    
    def index
        @announces = Announce.find(User.find(session[:user_id]).courses.id).all
    end

    def show
    end

    def new
        @announce = Announce.new
    end

    def create
        @announce = Announce.new(announce_params)
        if @announce.save
            redirect_to controller: 'ta', action: 'index'
        else
            flashp[:notice] = '所有欄位皆為必填！'
            redirect_to action: new
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
        redirect_to controller: 'ta', action: 'course'
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
      params.require(:announce).permit(:course_id, :tag, :topic, :content)
    end
end

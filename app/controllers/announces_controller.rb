class AnnouncesController < ApplicationController
    before_action :set_announce, only: [ :show, :edit, :update, :destroy ]

    def index
        @announces = Announce.find(User.find(session[:user_id]).courses.id)
    end

    def show
    end

    def new
        @announce = Announce.new
    end

    def create
        @announce = Announce.new(announce_params)
        if @announce.save
            redirect_to action: 'index'
        else
            flashp[:notice] = '所有欄位皆為必填！'
            redirect_to action: new
        end
    end

    def edit
    end

    def update
        if @announce.update(announce_params)
            redirect_to action: 'show'
        else
            redirect_to action: 'edit'
        end
    end

    def destroy
        @announce.destroy
        redirect_to action: 'index'
    end

    private

    def set_announce
        @announce = Announce.find(params[:id])
    end

    #data validation
    def announce_params
      params.require(:announce).permit(:course_id, :tag, :topic, :content)
    end
end

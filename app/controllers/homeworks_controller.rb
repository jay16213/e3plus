class HomeworksController < ApplicationController
    before_action :set_user_info
    before_action :set_hw, only: [ :show, :upload, :download ]

    layout :determine

    #hw.status: 0 => handed_in, 1~3 => not yet, 4 => out of time
    #1 => safe, 2 => warnning, 3 => danger
    def index
        @not_finisheds = Homework.where(user_id: @user.id, status: [1, 2, 3]).joins(:announce).merge(Announce.order(:deadline))
        @finisheds = Homework.where(user_id: @user.id, status: 0).joins(:announce).merge(Announce.order(:deadline))
        #update status
        @not_finisheds.each do |hw|
            diff = hw.announce.deadline - Time.now.to_datetime #in seconds
            if diff < 0 # out of time
                hw.status = 4
            elsif diff < 86400 #less then 1 day
                hw.status = 3
            elsif diff > 86400 && diff < 604800 # less than 1 week
                hw.status = 2
            else
                hw.status = 1
            end
            hw.save
        end
    end

    def show
    end

    #upload file
    def upload
        @hw.update(file_params)
        @hw.save!

        if @hw.file.file.nil?
            flash[:notice] = "上傳失敗，請重新上傳！"
            render action: :show, id: @hw.user.id
        else
            @hw.status = 0
            @hw.save!
            flash[:notice] = "成功上傳了一份作業！"
            redirect_to :homeworks_index
        end
    end

    private

    def set_user_info
        @user = User.find(session[:user_id])
        @courses = @user.courses.all
    end

    def determine
        (@user.identity == "student") ? "student" : "ta"
    end

    def set_hw
        @hw = Homework.find(params[:id])
    end

    def file_params
         params.require(:homework).permit(:file)
    end
end

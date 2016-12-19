class HomeworksController < ApplicationController
    before_action :set_user_info
    before_action :set_hw, only: [:show, :upload, :download ]

    layout :determine

    def index
        @hw = @user.homeworks.all
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
            @hw.handed_in = true
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

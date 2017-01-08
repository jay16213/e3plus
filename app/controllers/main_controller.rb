class MainController < ApplicationController
  #set user information
  before_action :set_user_info
  before_action :find_announce, only: [ :edit_announce, :update_announce, :destroy_announce ]
  
  #announce system for student
  def student_index
  end

  #announce system for ta
  def ta_index
  end

  #redirect to index
  def home
    case @user.identity
      when 'student'
        redirect_to action: 'student_index'
      when 'ta'
        redirect_to action: 'ta_index'
    end
  end

  #show course page
  def course
    @course = Course.find(params[:id])
  end

####################FOR TA####################
  def new_announce
    @announce = Announce.new
  end

  def create_announce
    @announce = Announce.new(announce_params)
    if @announce.save
      #TO DO: judge what page is user at now, course or ta_index?
      redirect_to action: 'ta_index'
    else
      flash[:notice] = "所有欄位皆為必填！"
      redirect_to action: 'new_announce'
    end
  end

  def edit_announce
    
  end

  def update_announce
    if @announce.update(announce_params)
      redirect_to action: 'ta_index'
    else
      redirect_to action: edit_announce
    end
  end

  def destroy_announce
    @announce.destroy
    
    #TO DO: judge what page is user at, course or ta_index
    redirect_to action: 'ta_index'
  end
##############################################

  private

    def set_user_info
      @user = User.find_by_id(session[:user_id])
      @courses = @user.courses.all
      #TO DO: create announce & calendar database
      #TO DO: set announce & calendar nofication card info
    end

    def find_announce
      @announce = Announce.find(params[:id])
    end

    def announce_params
      params.require(:announce).permit(:course_id, :tag, :topic, :content)
    end
end

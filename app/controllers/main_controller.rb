class MainController < ApplicationController
  #set user information
  before_action :set_user_info

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
    @announce = Announce.new(params[:announce])
    @announce.save

    #TO DO: judge what page is user at now, course or ta_index?
    redirect_to action: 'ta_index'
  end

  def edit_announce
    @announce = Announce.find(params[:id])
  end

  def destroy_announce
    @announce = Announce.find(params[:id])
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
end

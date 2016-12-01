class MainController < ApplicationController
  #set user information
  before_action :set_user_info

  #announce system for student
  def student_index
  end

  #announce system for ta
  def ta_index
  end

  #show course page
  def course
  end

  private

    def set_user_info
      @courses = User.find_by_id(session[:user_id]).courses.all
      #TO DO: create announce & calendar database
      #TO DO: set announce & calendar nofication card info
    end
end

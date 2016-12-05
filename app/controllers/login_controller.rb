class LoginController < ApplicationController
  def login
    #login session
    session[:user_id] = nil
      
    if request.post?#login action
        #find user's account
        user = User.find_by_account(params[:account])
        
        #account exists
        if user
            #check password
            if user.authenticate(params[:password])
                session[:user_id] = user.id
                
                #redirect to different pages depend on identity
                case user.identity
                    when "student"
                        redirect_to :student_index
                    when "ta"
                        redirect_to :ta_index
                    else
                        flash[:notice] = "系統錯誤！請稍候再試"
                end
            else
                flash[:notice] = "密碼錯誤！請重新登入"
            end

        else
            flash[:notice] = "登入失敗！查無此帳戶！"
        end
    end
  end

  #logout action
  def logout
    
    session[:user_id] = nil
    redirect_to :action => 'login'
  end

end

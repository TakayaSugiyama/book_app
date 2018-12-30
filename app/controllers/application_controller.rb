class ApplicationController < ActionController::Base
  before_action :set_current_user
  
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end
    
    def fordid_not_login_user
       if  session[:user_id] == nil
          redirect_to("/users/login_form")
       end
    end
    
    def fordid_login_user
      if @current_user
        redirect_to("/users/show/#{@current_user.id}")
      end
    end
    
    def forbid_not_current_user
       if @current_user.id != params[:id].to_i
         redirect_to("/users/show/#{@current_user.id}")
       end
    end
    
    
    
end

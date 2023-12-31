class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    helper_method :current_user,:loged_in?
   def login(user)
    session[:session_token]=@user.reset_session_token
   end
    def loged_in?
       !!current_user
    end
   def current_user
     @current_user||= User.find_by(session_token: session[:session_token])
   end
def logout
    current_user.reset_session_token if loged_in?
    session[:session_token]=nil 
    current_user=nil
end

def require_logged_in
    redirect_to new_session_url unless loged_in
end
def required_log_out
redirect_to users_url unless loged_in
end

end
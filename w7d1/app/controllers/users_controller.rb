class UsersController < ApplicationController
    before_action :require_logged_in,only[:index,:show,:edit,:update]
    before_action :required_log_out,only[:new,:create]
def show
    user=User.find(params[id])
    render json: user
end
def index
    @users = User.all.order(:id)
    # render json: users
    render :index
end
  

end

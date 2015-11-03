class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    user  = User.find(params[:id])
    render json: user
  end

  def create
      user = User.new(user_params)
      #return render status: :unauthorized unless user.user.authenticate(request.headers["Authorization"].split(' ')[1])
      if user.save
        render json: user, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

    def follow
      user = User.find(params[:user_id])
      current_user.follow(user)
end

  def unfollow
    user = User.find(params[:user_id])
    current_user.stop_following(user)
  end


private

def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end

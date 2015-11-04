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

  def login
      user = User.find_by(email: params[:email])
      if user && user.password == params[:password_digest]
        user.generate_token
        render json: { token: user.auth_token }
      else
        render json: { error: 'Incorrect credentials' }, status: :unauthorized
      end
    end


  # def current_user
  #   current_user == self.user_id
  # end

  def follow
    user = User.find(params[:user_id])
    current_user.follow(user)
  end

  def unfollow
    user = User.find(params[:user_id])
    current_user.stop_following(user)
  end

  # def edit
  #   user = User.find(params[:id])
  #   if user.edit(user_id)
  #     head :no_content
  #   else
  #     render json: user.errors, status: :unprocessable_entity
  #   end
  # end


  private

  def set_user
     @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:email, :password_digest)
  end

end

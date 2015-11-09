class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:follow, :unfollow]

  def index
    if params[:q]
        users = User.where("email ILIKE ?", "%#{params[:q]}%")
      else
        users = User
      end
      users = users.page(params[:page]).per(params[:size])
      respond_to do |format|
        format.html { render locals: {users: users} }
        format.json { render json: users, include: params[:include] }
      end
  end


  def show
    user = User.find(params[:id])
    respond_to do |format|
      format.html { render locals: {user: user} }
      format.json { render json: user, include: params[:include] }
    end
  end

  def create
    user = User.new(user_params)
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
    params.require(:user).permit(:email, :password)
  end

end

class UsersController < ApplicationController 
  before_action :require_current_user!, except: [:create, :new]
  
  def create 
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      render :show
    else 
      render json: @users.errors.full_messages
    end 
  end 

  def new 
    @user = User.new
  end 

  def show 
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end 
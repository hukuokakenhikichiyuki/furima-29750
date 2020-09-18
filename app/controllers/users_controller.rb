class UsersController < ApplicationController

  def index
    @users =User.all
  end

  def new
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

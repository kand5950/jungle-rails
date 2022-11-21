class UsersController < ApplicationController

  #rendering signup form
  def new
  end

  #receiving form and creating a user with forms parameters
  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end

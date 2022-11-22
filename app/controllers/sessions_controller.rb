class SessionsController < ApplicationController

  def new
  end

  def create
    
    #if the user is successfully authenticated
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      #save the user id inside the browser cookie. this is how we keep the user logged in when they navigate around our website
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end

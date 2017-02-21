class SessionsController < ApplicationController
  def index
  end

  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
   
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user

      
    else
      flash[:message] = 'Invalid'
      redirect_to sessions_new_path
    end
  end 

  def destroy
    reset_session
    redirect_to '/sessions/new'
    
  end
end

class SessionsController < ApplicationController
  def index
  end

  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
   
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/users'

      
    else
      flash[:message] = 'Invalid'
      redirect_to '/session/new'
    end
  end 

  def destroy
    session.delete[:user_id]
    redirect_to '/sessions/new'
    
  end
end

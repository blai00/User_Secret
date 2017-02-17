class UsersController < ApplicationController
    # before_action :require_login, except: [:new, :create]
    # before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
    def show
        @user = User.find(params[:id])
    end 
    
    def new
    end 
    
    def create
        user = User.new(user_params)
        if user.valid?
            user.save
            session[:user_id] = user.id
            redirect_to user
        else
            flash[:message] = 'Invalid'
            redirect_to '/users/new'
        end 
            
    end
    
    def edit
        @user = User.find(params[:id])
        redirect_to "/users/#{params[:id]}"
        
    end 
    
    def update
        user = User.find(params[:id]).update
        redirect_to user
    end
    
    def destory
        User.find(params[:id]).destroy
        redirect_to "/sessions/new"
    end 
    
    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end

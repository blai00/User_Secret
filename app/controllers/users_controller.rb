class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]
    before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
    def show
        puts @user.secrets.inspect
    end 
    
    def new
    end 
    
    def create
        user = User.create(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user
        else
            flash[:message] = 'Invalid'
            puts user.inspect
            redirect_to '/users/new'
            
        end 
            
    end
    
    def edit
        
    end 
    
    def update
        @user.update(name: user_params[:name], email: user_params[:email])
        redirect_to @user
    end
    
    def destroy
        @user.destroy
        session[:user_id].destroy
        redirect_to "/sessions/new"
    end 
    
    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def set_user
       @user =  User.find(params[:id])
    end
    
    
end

class SecretController < ApplicationController
     before_action :require_login, only: [:index, :create, :destroy]
    def index
        @secret = Secret.all()
    end
    
    
    def create
        secret = Secret.new
        if secret.valid?
            secret.save()
            redirect_to users
        else 
            flash[:message] = 'Invalid secret'
            redirect_to users
        end 
    end
            
    def destroy 
        secret = Secret.find(:id)
        secret.destroy if secret.user == current_user
        redirect_to users_show_url
        
    end 
            
  
end
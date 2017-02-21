class SecretsController < ApplicationController
     before_action :require_login, only: [:index, :create, :destroy]
     before_action :set_secret, only: [:destroy]
    def index
        @secrets = Secret.all
       
    end
    
    
    def create
        user = current_user
        secret = Secret.create(secret_params)
        puts secret.inspect
        puts secret_params.inspect
        puts params.inspect
        
        if secret.save
            redirect_to user
        else 
            flash[:message] = 'Invalid secret'
            redirect_to users
        end 
    end
            
    def destroy 
        puts params.inspect
        
        @secret.destroy if @secret.user == current_user
        
        redirect_to current_user
        
    end 
    
    private
    
    def secret_params
         params.require(:secret).permit(:content, :user_id)
    end
    
    def set_secret
        @secret = Secret.find(params[:id])
    end
            
  
end
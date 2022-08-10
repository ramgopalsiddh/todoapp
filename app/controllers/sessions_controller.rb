class SessionsController < ApplicationController
   # create login form 
    def new
    end 
    
    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "logged in successfully"
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end
    end
   # log out 
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out" 
    end 
end
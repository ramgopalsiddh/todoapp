class PasswordResetsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            #send email for password reset
            PasswordMailer.with(user: @user).reset.deliver_now
        end
        redirect_to  root_path,  notice:"if  an accunt with that email was found , we send link to reset your password" 
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset" )
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path , alert: "Your token has expired, please try again "
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset" )
    end
end
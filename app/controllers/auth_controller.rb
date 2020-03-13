class AuthController < ApplicationController 

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: user, except: :password_digest
        elsif user
            render json: {error: 'incorrect password'}
        else
            render json: {error: 'no user or password found'}
        end
            
    end

end

  
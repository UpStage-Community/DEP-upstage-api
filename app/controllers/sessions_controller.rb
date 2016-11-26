class SessionsController < ApplicationController
    def create
        user_password = session_params[:password]
        user_email = session_params[:email].downcase
        user = user_email.present? && User.find_by(email: user_email)

        if user and user.valid_password? user_password
            sign_in user, store: false
            user.generate_authentication_token!
            user.save
            render json: user, status: 200
        else
            render json: { errors: "Invalid email or password" }, status: 422
        end
    end

    def destroy
        user = User.find_by(auth_token: params[:id])    
        user.generate_authentication_token!
        user.save
        head 204
    end

    def show
        user = User.find_by(auth_token: params[:id])
        render json: user, status: 200
    end

    def session_params
        params.require(:session).permit(:password, :email)
    end
end

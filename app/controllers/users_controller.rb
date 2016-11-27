class UsersController < ApplicationController
    skip_before_action :authenticate_with_token!, only: [:show, :create]
    before_action :check_self, only: [:update, :destroy]

    def check_self
        @user= User.where(id: params[:id])[0]
        if !@user
            render json: { errors: "User does not exist" }, status: 404
            return
        end
        @auth_user = current_user
        if !@auth_user
            authentication_error
            return
        elsif @auth_user != @user
            render json: { errors: "You do not have permission to perform this action"}, status: 403
            return
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user, status: 201
        else
            render json: { errors: user.errors.messages }, status: 422
        end
    end

    def update
        user = User.find(params[:id])

        if user.update(user_params)
            render json: user, status: 200
        else
            render json: { errors: user.errors.messages }, status: 422
        end
    end


    def destroy
      user = User.find(params[:id])
      user.destroy
      head 204
    end

    private

    def user_params
        params.require(:user).permit(
            :email, 
            :password, 
            :password_confirmation, 
            :url, 
            :bio, 
            :first_name,
            :last_name,
            :image
        )
    end
end

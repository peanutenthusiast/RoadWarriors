module Api

  class UsersController < ApplicationController

    before_action :set_user, only: [:update, :show, :destroy]

    def show
    end

    #  This would create a new user object
    def new
      @user = User.new
    end

    # This would save the user object with entered params in the DB
    def create
      @user = User.new(user_params)

      if @user.save
        render json: {status: 'SUCCESS', message: 'Account successfully created', accessToken: @user.access_token}
      else
        render json: @user.errors, status: 422
      end

    end

    # def edit
    #   if @user
    #     render json: {status: 'SUCCESS', message: 'User credentials successfully updated', accessToken: @user.access_token}.to_json

    # end


    # def update
    #   if @user.update_attributes(email: params[:user][:email], params[:user][:password])
    #     render json: {status: 'SUCCESS', message: 'User credentials successfully updated', accessToken: @user.access_token}.to_json
    #   elsif @user.update_attributes(username: params[:user][:username])
    #     render json: {status: 'SUCCESS', message: 'Account successfully updated'}.to_json
    #   else
    #     render json: { errors: ['Update unsuccessful!'], status: 422 }.to_json
    #   end
    end

    end









    private
      def set_user
        @user = User.find_by(access_token: params[:access_token])
      end

      def user_params
        params.require(:user).permit(:username, :email, :password)
      end

  end

end

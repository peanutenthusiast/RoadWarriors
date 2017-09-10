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
        render json: {status: 'SUCCESS', message: 'Account successfully created', accessToken: @user.access_token}.to_json
      else
        render json: {errors: ["Sign up failed!"], status: 422}.to_json
      end

    end

    def edit

      if @user
        render json: {@user, only: [:email, :username], status: 'SUCCESS'}
      else
        render text: "User can not be identified !", status: 422
      end

    end

    def update

      if @user.update_attributes(user_params)
        render json: {status: 'SUCCESS', message: 'Account successfully updated'}.to_json
      else
        render json: { errors: ['Update unsuccessful!'], status: 422 }.to_json
      end

    end


    def destroy
      if @user.destroy
        render text: "Account has been successfully deleted.", status: 'SUCCESS'
      else
        render text: "Something went wrong..", status: 422
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

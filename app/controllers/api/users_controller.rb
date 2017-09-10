module Api

  class UsersController < ApplicationController

    before_action :set_user, only: [:update, :show, :destroy]

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, 




    end







    private
      def set_user
      end




  end

end

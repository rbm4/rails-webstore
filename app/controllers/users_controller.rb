class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(users_params)
        @user.active = true
        @user.approved = true
        @user.confirmed = true
        @user.role = "member"
        if @user.save
            flash[:success] = "Cadastro efetuado!"
            redirect_to root_path
        else
            render :new
        end
    end

  private
    def users_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end

class UserSessionsController < ApplicationController
  
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      flash[:success] = "Bem vindo de volta!"
      redirect_to '/'
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:success] = "Até breve!"
    redirect_to '/'
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user_session, :current_user, :require_user
  
  def require_no_user
    if current_user
        flash[:notice] = "You must be logged out to access this page"
        redirect_to root_path
        return false
    end
  end
  
  def require_user
    unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to sign_in_path
        return false
    end
  end
 
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
  protected
    def handle_unverified_request
      # raise an exception
      fail ActionController::InvalidAuthenticityToken
      # or destroy session, redirect
      if current_user_session
        current_user_session.destroy
      end
      redirect_to root_url
    end
end

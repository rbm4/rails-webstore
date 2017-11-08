class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user_session, :current_user, :require_user, :require_admin, :post_permissions, :set_s3_direct_post
  
  def require_no_user
    if current_user
        flash[:notice] = "You must be logged out to access this page"
        redirect_to root_path
        return false
    end
  end
  def require_poster
    if current_user != nil and current_user.role == 'poster'
      return true
    end
  end
  def require_user
    unless current_user
        flash[:notice] = "Você deve logar primeiro para acessar essa página."
        redirect_to sign_in_path
        return false
    end
  end
  def require_admin
    if current_user
      if current_user.role == 'admin'
        return true
      else
        return false
      end
    end
  end
  def require_editor
    if current_user
      if current_user.role == 'editor'
        return true
      else
        return false
      end
    end
  end
  def post_permissions
    if current_user
      if require_admin or require_poster or require_editor
        p 'true'
        return true
      else
        p 'false'
        return false
      end
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
    def set_s3_direct_post
        @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
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

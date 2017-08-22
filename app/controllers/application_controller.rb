class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def login_required
    @current_user = current_user
    redirect_to root_path unless @current_user
  end

  private

    def current_user
      @current_user ||= SessionUser.new(session) if session[:user_id]
    end
end

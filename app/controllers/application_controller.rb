class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :user_signed_in?, :current_user
  
  def user_signed_in? #현재 로그인 중인지?
      session[:sign_in_user].present?
  end
  
  def authenticate_user #로그인 안되어있을 때, 로그인 페이지로
      redirect_to sign_in_path unless user_signed_in?
  end
  
  def current_user
      @current_user = User.find(session[:sign_in_user]) if user_signed_in?
  end
  
end

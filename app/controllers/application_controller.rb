# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  include HasCurrentGroup
  http_basic_authenticate_with name: 'mundo', password: 'tornado'

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_user 
    redirect_to login_url, alert: "Dime quien eres y te diré con quién escribes." if current_user.nil?
  end

  def login_user(user)
    if user.present?
      session[:user_id] = user.id
      user.update_attributes(last_login_at: Time.now, login_count: user.login_count + 1)
    else
      session[:user_id] = nil
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "No puedes entrar ahí..."
    redirect_to root_url
  end
end

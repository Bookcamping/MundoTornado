# encoding: utf-8
class SessionsController < ApplicationController
  expose(:user) { User.new }

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "¡Bienvenida!"
    else
      flash.now.alert = "Correo o contraseña no válidos... Inténtalo de nuevo."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "¡Hasta pronto!"
  end

  def enter
    if !Rails.env.production? || (current_user && current_user.admin?)
      session[:user_id] = params[:id]
    end
    redirect_to root_path
  end
end

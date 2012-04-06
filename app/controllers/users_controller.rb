class UsersController < ApplicationController
  before_filter :require_user, except: [:new, :create]
  expose(:users) { User.all }
  expose(:user)

  def index
  end

  def new
  end

  def create
    if user.save
      session[:user_id] = user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end
end

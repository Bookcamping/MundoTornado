class UsersController < ApplicationController
  expose(:users) { User.all }
  expose(:user)

  def index
    can :show, User
  end

  def new
    authorize! :create, User
  end

  def create
    authorize! :create, User
    if user.save
      login_user(user)
      redirect_to root_url, notice: "Bienvenida a ficciones bookcamping."
    else
      render "new"
    end
  end
end

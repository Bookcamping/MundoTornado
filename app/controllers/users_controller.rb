class UsersController < ApplicationController
  respond_to :html

  expose(:users) { User.scoped }
  expose(:user)

  def index
    authorize! :index, User
  end

  def show 
    authorize! :show, user
    respond_with user
  end

  def new
    authorize! :create, User
    respond_with user
  end

  def edit
    authorize! :update, user
    respond_with user
  end

  def create
    authorize! :create, User
    if user.save
      user.update_attribute(:admin, true) if user.id == 1
      login_user(user)
      redirect_to root_url, notice: "Bienvenida a ficciones bookcamping."
    else
      render "new"
    end
  end

  def update
    authorize! :update, user
    flash[:notice] = 'Datos guardados' if user.update_attributes(params[:user])
    respond_with user, location: root_path
  end
end

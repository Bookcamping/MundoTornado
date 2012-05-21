class GroupsController < ApplicationController
  before_filter :require_user
  respond_to :html

  expose(:groups) { Group.all }
  expose(:group)

  def index
    authorize! :show, Group
    respond_with groups
  end

  def show
    redirect_to groups_path
  end

  def new
    authorize! :create, Group
    respond_with group
  end

  def create
    group.user = current_user
    authorize! :create, group
    flash[:notice] = 'Nuevo grupo creado.' if group.save
    respond_with group
  end
end

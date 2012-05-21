class GroupsController < ApplicationController
  before_filter :require_user
  respond_to :html

  expose(:groups) { Group.all }
  expose(:group)

  def index
    authorize! :show, Group
    respond_with groups
  end
end

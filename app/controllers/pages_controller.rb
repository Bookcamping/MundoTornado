class PagesController < ApplicationController
  respond_to :html

  expose(:pages) { current_group.pages }
  expose(:page)

  def index
    authorize! :index, Page
    respond_with pages
  end

  def show
    authorize! :read, page
    respond_with page
  end

  def new
    authorize! :create, Page
    respond_with page
  end

  def create
    page.user = current_user
    page.group = current_group
    authorize! :create, page
    flash[:notice] = 'Lo tenemos!' if page.save
    respond_with page
  end
end

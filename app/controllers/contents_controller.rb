# encoding: utf-8
class ContentsController < ApplicationController
  respond_to :html

  def index
    authorize! :index, model 
    respond_with contents
  end

  def show
    authorize! :read, content
    respond_with content
  end

  def new
    authorize! :create, model
    respond_with content
  end

  def edit
    authorize! :update, content
    respond_with content
  end

  def create
    content.user = current_user
    content.group = current_group
    authorize! :create, content
    flash[:notice] = '¡Guardado!' if content.save
    respond_with content
  end


  def update
    authorize! :update, content
    flash[:notice] = '¡Ahora sí!' if content.update_attributes(params[:content])
    respond_with content
  end

  def destroy
    authorize! :destroy, content
    flash[:notice] = 'Bye, bye...' if content.destroy
    respond_with content
  end
end

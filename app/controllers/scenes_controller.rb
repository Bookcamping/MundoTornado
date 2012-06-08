# encoding: utf-8
class ScenesController < ApplicationController
  respond_to :html
  before_filter :require_user

  expose(:chapter) { current_group.chapters.find(params[:chapter_id]) }
  expose(:scenes) { chapter.scenes }
  expose(:scene)

  def new
    authorize! :create, Scene
    respond_with scene
  end

  def edit
    authorize! :update, scene
    respond_with scene
  end

  def create
    scene.content_type = 'markdown'
    authorize! :create, scene
    flash[:notice] = 'Vámonos' if current_user.add_scene(chapter, scene)
    respond_with scene, location: chapter_path(chapter)
  end

  def update
    authorize! :update, scene
    scene.attributes = params[:scene]
    flash[:notice] = 'Ahora mejor' if scene.save
    respond_with scene, location: chapter_path(chapter)
  end

  def destroy
    authorize! :destroy, scene
    scene.destroy
    flash[:notice] = '¡Fuera!' if scene.destroy
    respond_with scene, location: chapter
  end

end

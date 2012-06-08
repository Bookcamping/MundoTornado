# encoding: utf-8
class ChaptersController < ApplicationController
  respond_to :html
  before_filter :require_user, except: [:index, :show]

  expose(:chapters) { current_group.chapters }
  expose(:chapter)
  expose(:next_chapter) { chapter.lower_item }

  def index
    first = chapters.first
    if first.present?
      redirect_to first
    else
      respond_with chapters
    end
  end

  def show
    authorize! :read, chapter
    respond_with chapter
  end

  def new
    authorize! :create, Chapter
    respond_with chapter
  end

  def create
    chapter.user = current_user
    chapter.group = current_group
    authorize! :create, chapter
    flash[:notice] = 'Capítulo añadido. ¡A escribir!' if chapter.save
    respond_with chapter
  end

end

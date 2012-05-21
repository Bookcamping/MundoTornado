# encoding: utf-8
class PublicationsController < ApplicationController
  respond_to :html, :json
  before_filter :require_user

  expose(:publications) { current_user.publications }
  expose(:publication)

  def index
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        generator = PdfGenerator.new(publication, view_context)
        send_data generator.render, filename: "#{publication.title}.pdf",
          type: 'application/pdf', disposition: 'inline'
      end
      format.epub do
        epub = EeePub::Easy.new do
          title       'sample'
          creator     'jugyo'
          publisher   'jugyo.org'
          date        '2010-05-06'
          identifier  'http://example.com/book/foo', :scheme => 'URL'
          uid         'http://example.com/book/foo'
        end

        epub.save("#{Rails.root}/tmp/sample.epub")
        send_file "#{Rails.root}/tmp/sample.epub", type: 'application/epub+zip',
          disposition: 'inline'
      end
    end
  end

  def read

  end

  def new
  end

  def edit
  end

  def create
    flash[:notice] = 'Publicación creada' if publication.save
    respond_with publication
  end

  def update
    flash[:notice] = 'Publicación guardada' if publication.update_attributes(params[:publication])
    respond_with publication
  end
end

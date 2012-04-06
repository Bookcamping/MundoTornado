class PdfGenerator
  def initialize(publication, ctx)
    @pdf = PdfWriter.new
    @publication = publication
    render = PdfRender.new
    render.pdf = @pdf
    @markdown = Redcarpet::Markdown.new(
      render, 
      autolink: true,
      space_after_headers: true,
      superscript: true)
  end

  def render
    @pdf.header(@publication.title, 1)
    @pdf.author("Por #{@publication.author}")
    @markdown.render(@publication.content)
    @pdf.render
  end
end


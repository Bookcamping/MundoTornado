class PdfGenerator
  def initialize(publication, ctx)
    @pdf = PdfWriter.new
    @publication = publication
    render = PdfRender.new
    render.pdf = @pdf
    @markdown = Redcarpet::Markdown.new(render)
  end

  def render
    @pdf.header(@publication.title, 1)
    @pdf.author("Por #{@publication.author}")
    @markdown.render(@publication.content)
    @pdf.render
  end
end

class PdfWriter < Prawn::Document
  def initialize
    super(page_layout: :portrait, margin: [80, 50])
    setup_fonts
  end

  def setup_fonts
    font 'Times-Roman'
    default_leading 5
  end

  def paragraph(text)
    text(text, align: :justify)
    move_down 30
  end

  SIZES = [36, 24, 18, 16, 16, 16, 16]
  def header(title, level)
    index = level - 1
    index = 0 if index < 0
    index = 6 if index > 6
    size = SIZES[index]
    move_down size / 2
    text(title, size: size)
    move_down 10
  end

  def author(author)
    move_up 10
    text(author, style: :italic)
    move_down 60
  end
end


class PdfRender < Redcarpet::Render::Base
  attr_accessor :pdf

  [
    # block-level calls
    :block_code, :block_quote,
    :block_html, :header, :list,
    :list_item, 

    # span-level calls
    :autolink, :codespan, :double_emphasis,
    :emphasis, :raw_html, :triple_emphasis,
    :strikethrough, :superscript,
  ].each do |method|
      define_method method do |*args|
      end
    end

    def paragraph(text)
      @pdf.paragraph(text)
      ''
    end

    def header(title, level)
      @pdf.header(title, level + 1)
      ''
    end
end

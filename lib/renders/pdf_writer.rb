
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
    text text, align: :justify, inline_format: true
    move_down 10
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



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

    def double_emphasis(text)
      "<b>#{text}</b>"
    end

    def emphasis(text)
      "<i>#{text}</i>"
    end

    def codespan(code)
      "<font name='Courier'>#{code}</font>"
    end

    def superscript(text)
      "<sup>#{text}</sup>"
    end

    def header(title, level)
      @pdf.header(title, level + 1)
      ''
    end
end


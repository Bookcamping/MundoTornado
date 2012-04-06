module ContentHelper
  def render_content(model)
    rendered = ''
    if model.content_type == 'markdown'
      rendered = markdown.render(model.content)
    else
      rendered = h(model.content)
    end
    raw(rendered)
  end

  def markdown
    @markdown ||= Redcarpet::Markdown.new(::PubHubHTML, 
      autolink: true, 
      space_after_headers: true,
      superscript: true)
  end
end

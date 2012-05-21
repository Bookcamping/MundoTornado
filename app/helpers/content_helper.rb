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

end

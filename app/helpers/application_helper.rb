module ApplicationHelper
  def title(title)
    content_for(:title) { title }
    content_tag(:h1, title)
  end

  def markdown(text) 
    return '' if text.blank?
    raw markdowner.render(text)
  end

  def markdowner
    @markdown ||= Redcarpet::Markdown.new(::PubHubHTML, 
                                          autolink: true, 
                                          space_after_headers: true,
                                          superscript: true)
  end

  def sidebar?
    action = request.path_parameters[:action]
    action == 'index' || action == 'show'
  end

  def icon(icon, label = '')
    raw("<i class=\"icon-#{icon}\"></i>#{label}")
  end
end

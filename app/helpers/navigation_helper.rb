module NavigationHelper
  def nav_tab(title, url, options = {})
    current_tag = options.delete(:current)
    options[:class] = (current_tag == title) ? 'active' : 'inactive'
    content_tag(:li, link_to(title, url, options))
  end
end

class PubHubHTML < Redcarpet::Render::HTML
  def header(text, level)
    level += 1
    "<h#{level}>#{text}</h#{level}>"
  end
end

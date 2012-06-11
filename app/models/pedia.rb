class Pedia < Content
  before_validation :normalize_title

  def mentions
    Scene.where(Scene.arel_table[:content].matches("%#{self.title}%"))
  end

  private
  def normalize_title
    self.title = title.parameterize.gsub /^#*/, '#'
  end

end

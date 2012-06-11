class Character < Content

  before_validation :normalize_title
  validates_uniqueness_of :title, scope: :group_id

  def mentions
    Scene.where(Scene.arel_table[:content].matches("%#{self.title}%"))
  end

  private
  def normalize_title
    self.title = self.title.gsub /^@*/, '@'
  end
end

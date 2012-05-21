class Content < ActiveRecord::Base
  attr_accessible :title, :author, :content, :content_type
  attr_accessible :user, :group, :user_id, :group_id

  validates_presence_of :title, :user_id, :group_id
  
  CONTENT_TYPES = ['markdown']

  def to_param
    "#{id}-#{title.parameterize}"
  end

end

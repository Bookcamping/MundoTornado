class Chapter < ActiveRecord::Base
  attr_accessible :title, :summary
  attr_accessible :user, :user_id, :group, :group_id

  belongs_to :user
  belongs_to :group
  has_many :scenes, order: 'position ASC'

  
  validates_presence_of :title, :user_id, :group_id

  acts_as_list scope: :group_id

  def to_param
    "#{id}-#{title.parameterize}"
  end
end

class Scene < ActiveRecord::Base
  attr_accessible :content, :content_type
  attr_accessible :user, :user_id, :group, :group_id
  attr_accessible :chapter, :chapter_id

  belongs_to :user
  belongs_to :group
  belongs_to :chapter, counter_cache: true
  has_many :participants, dependent: :destroy

  validates_presence_of :content, :content_type, :user_id, :group_id, :chapter_id

  acts_as_list scope: :chapter_id

  after_create :add_owner_participant

  def add(user)
    Participant.build!(self, user)
  end

  private
  def add_owner_participant
    add(self.user)
  end
end

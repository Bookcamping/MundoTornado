class Participant < ActiveRecord::Base
  attr_accessible :user, :group, :chapter, :scene
  attr_accessible :user_id, :group_id, :chapter_id, :scene_id
  belongs_to :user
  belongs_to :group
  belongs_to :scene, counter_cache: true
  belongs_to :chapter

  validates_presence_of :user_id, :group_id, :scene_id, :chapter_id

  def self.build!(scene, user)
    participant = Participant.where(scene_id: scene.id).where(user_id: user.id).first
    participant ||= Participant.create!(user: user, scene: scene, group_id: scene.group_id, chapter_id: scene.chapter_id)
  end
end

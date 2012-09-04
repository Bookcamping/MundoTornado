class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_secure_password

  has_many :groups

  attr_accessible :name, :email, :password, :password_confirmation
  attr_accessible :login_count, :last_login_at
  attr_accessible :admin
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def add_scene(chapter, scene)
    scene.chapter = chapter
    scene.group = chapter.group
    scene.user = self
    scene.save!
    scene
  end
end

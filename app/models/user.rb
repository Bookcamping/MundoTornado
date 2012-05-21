class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_secure_password

  has_many :groups

  attr_accessible :name, :email, :password, :password_confirmation
  attr_accessible :login_count, :last_login_at
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end

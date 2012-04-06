class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name
  has_secure_password

  has_many :publications, dependent: :destroy

  attr_accessible :name, :email, :password, :password_confirmation
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end

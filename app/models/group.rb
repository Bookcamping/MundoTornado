class Group < ActiveRecord::Base
  attr_accessible :name, :subdomain, :description
  validates_presence_of :name, :subdomain

  belongs_to :user
  has_many :seeds, order: 'created_at DESC'
end

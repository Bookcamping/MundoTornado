class Group < ActiveRecord::Base
  attr_accessible :name, :subdomain
  validates_presence_of :name, :subdomain

  belongs_to :user
end

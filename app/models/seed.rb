class Seed < ActiveRecord::Base
  attr_accessible :body
  attr_accessible :user, :group, :user_id, :group_id
  validates_presence_of :user_id, :group_id, :body

  belongs_to :user
  belongs_to :group
end

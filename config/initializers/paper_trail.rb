# config/initializers/paper_trail.rb
class Version < ActiveRecord::Base
  attr_accessible :group_id #, :user_name

  belongs_to :group
  belongs_to :user, class_name: 'User', foreign_key: :whodunnit
end

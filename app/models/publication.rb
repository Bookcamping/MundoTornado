class Publication < ActiveRecord::Base
  belongs_to :user

  attr_accessible :title, :author, :publisher, :content, :content_type
  validates :title, presence: true

  CONTENT_TYPES = ['markdown']
end

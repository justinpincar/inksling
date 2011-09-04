class Comment < ActiveRecord::Base
  belongs_to :author
  belongs_to :ink

  validates_presence_of :author
  validates_presence_of :ink
  validates_presence_of :text
end

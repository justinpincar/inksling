class Following < ActiveRecord::Base
  belongs_to :follower, :class_name => 'Author'
  belongs_to :followed, :class_name => 'Author'

  validates_presence_of :follower
  validates_presence_of :followed
  validates_uniqueness_of :follower_id, :scope => :followed_id
  validate :validate_not_following_self

  private

  def validate_not_following_self
    errors.add(:follower, "You cannot follow yourself.") if follower_id == followed_id
  end
end

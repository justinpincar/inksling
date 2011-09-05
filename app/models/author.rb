class Author < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :remember_me, :autobiography

  has_many :inks

  has_many :followings, :class_name => 'Following', :foreign_key => 'followed_id'
  has_many :is_followings, :class_name => 'Following', :foreign_key => 'follower_id'
  has_many :followers, :class_name => 'Author', :through => :followings, :source => :follower
  has_many :is_following, :class_name => 'Author', :through => :is_followings, :source => :followed

  def self.thumbnail_url
    "http://www.gravatar.com/avatar/00000000000000000000000000000000?s=512&d=mm"
  end

  def thumbnail_url
    hash = Digest::MD5.hexdigest(self.email)
    "http://www.gravatar.com/avatar/#{hash}?s=512&d=mm"
  end
end

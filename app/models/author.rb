class Author < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :remember_me, :autobiography

  has_many :inks

  def self.thumbnail_url
    "http://www.gravatar.com/avatar/00000000000000000000000000000000?s=512&d=mm"
  end

  def thumbnail_url
    hash = Digest::MD5.hexdigest(self.email)
    "http://www.gravatar.com/avatar/#{hash}?s=512&d=mm"
  end
end

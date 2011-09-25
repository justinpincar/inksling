class Tag < ActiveRecord::Base
  extend FriendlyId
  friendly_id :text, :use => :slugged

  has_many :ink_tags
  has_many :inks, :through => :ink_tags

  def text=(val)
    write_attribute(:text, val.downcase)
  end
end

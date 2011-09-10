class Tag < ActiveRecord::Base
  has_many :ink_tags
  has_many :inks, :through => :ink_tags

  def text=(val)
    write_attribute(:text, val.downcase)
  end
end

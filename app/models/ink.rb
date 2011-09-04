class Ink < ActiveRecord::Base
  belongs_to :author
  has_many :comments

  def title
    self[:title].present? ? self[:title] : "(untitled)"
  end
end

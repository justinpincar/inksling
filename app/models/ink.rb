class Ink < ActiveRecord::Base
  belongs_to :user

  def title
    self[:title].present? ? self[:title] : "(untitled)"
  end
end

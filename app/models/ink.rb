class Ink < ActiveRecord::Base
  belongs_to :author

  def title
    self[:title].present? ? self[:title] : "(untitled)"
  end
end

class Ink < ActiveRecord::Base
  belongs_to :author
  has_many :comments

  has_many :ink_tags
  has_many :tags, :through => :ink_tags

  def title
    self[:title].present? ? self[:title] : "(untitled)"
  end

  def category
    self[:category].present? ? self[:category] : "other"
  end

  def thumbnail_url
    case category
      when "poem"
        "/images/icon_poem.png"
      when "short_story"
        "/images/icon_short_story.png"
      else
        "/images/icon_other.png"
    end
  end
end

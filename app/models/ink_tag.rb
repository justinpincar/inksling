class InkTag < ActiveRecord::Base
  belongs_to :inks
  belongs_to :tag
end

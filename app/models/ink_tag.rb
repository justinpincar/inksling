class InkTag < ActiveRecord::Base
  belongs_to :ink
  belongs_to :tag
end

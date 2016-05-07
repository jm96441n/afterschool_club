class Programtag < ActiveRecord::Base
  validates :program, presence: true
  validates :tag, presence: true
end

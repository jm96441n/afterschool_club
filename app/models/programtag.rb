class Programtag < ActiveRecord::Base
	belongs_to :program
	belongs_to :tag

  validates :program, presence: true
  validates :tag, presence: true
end

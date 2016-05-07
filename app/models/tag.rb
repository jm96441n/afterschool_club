class Tag < ActiveRecord::Base
	has_many :programtags
	has_many :programs, through: :programtags

  validates :name, presence: true
end

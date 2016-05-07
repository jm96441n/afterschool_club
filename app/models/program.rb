class Program < ActiveRecord::Base
	has_many :programtags
	has_many :tags, through: :programtags

	validates :actual, presence: true
	validates :address, presence: true
end

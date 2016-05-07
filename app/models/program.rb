class Program < ActiveRecord::Base
	has_many :programtags
	has_many :tags, through: :programtags

	validates :existing, presence: true
	validates :address, presence: true
end

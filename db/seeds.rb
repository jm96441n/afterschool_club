require 'csv'

options = {
	headers: true,
	header_converters: :symbol
}

CSV.foreach(File.dirname(__FILE__) + "/afterschool_programs.csv",options) do |row|
	p = Hash.new
	p[:existing] = true
	p[:organization] = row[:organization]
	p[:address] = row[:full_address]
	p[:email] = row[:email]
	p[:phone] = row[:phone]
	p[:website] = row[:url]
	p[:description] = row[:description]
	p[:lat] = row[:point_x].to_f
	p[:long] = row[:point_y].to_f
	p[:approved] = true
	prog = Program.create!(p)


end
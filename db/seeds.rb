require 'csv'

options = {
	headers: true,
	header_converters: :symbol
}

CSV.foreach(File.dirname(__FILE__) + "/afterschool_programs.csv",options) do |row|
	p = Hash.new
	p[:existing] = true
	p[:loc_name] = row[:loc_name]
	p[:address] = row[:address]
	p[:email] = row[:email]
	p[:phone] = row[:phone]
	p[:website] = row[:url]
	p[:description] = row[:description]
	p[:lat] = row[:point_x]
	p[:long] = row[:point_y]

	prog = Program.create(p)
	puts prog.loc_name
end
require 'csv'

# Program.create({
# 	existing: true,
# 	agency: 'Bronx Works',
# 	phone: '(718) 508-3190',
# 	boro: 'Bronx',
# 	address: 'BronxWorks McLaughlin Community Center, 1130 Grand Concourse, Bronx, NY 10456',
# 	name: 'Project Achieve After-School Program',
# 	description: ''
# })
#
# Program.create({
# 	existing: true,
# 	agency: 'Bronx Works',
# 	phone: '(718) 292-3452',
# 	boro: 'Bronx',
# 	address: 'PS 130, 750 Prospect Ave., Bronx, NY 10455',
# 	name: 'Express to Success After-School Program',
# 	description: ''
# })
#
# Program.create({
# 	existing: true,
# 	agency: 'Bronx Works',
# 	phone: '(718) 583-7366, ext. 1123',
# 	boro: 'Bronx',
# 	address: 'PS 42, 1537 Washington Ave., Bronx, NY 10457',
# 	name: 'COMPASS After-School Program',
# 	description: ''
# })
#
# Program.create({
# 	existing: true,
# 	agency: 'Bronx Works',
# 	phone: '(718) 292-6909',
# 	boro: 'Bronx',
# 	address: '500 E. 165th Street, Bronx, NY 10456',
# 	name: 'Third Avenue After-School Program',
# 	description: ''
# })
#
# Program.create({
# 	existing: true,
# 	agency: 'Bronx Works',
# 	phone: '(718) 640-5075',
# 	boro: 'Bronx',
# 	address: "725 St. Ann's Ave., Bronx, NY 10455",
# 	name: 'Bronxchester After-School Program',
# 	description: ''
# })


# r.each do |x|
# 	p = Hash.new
# 	p[:existing] = true
# 	p[:address] = x["address1"] + ", " + x["address2"]
# 	p[:agency] = x["agency_nam"]
# 	p[:phone] = x["agency_tel"]
# 	p[:boro] = x["site_boro"]
# 	p[:lat] = x["the_geom"]["coordinates"][0]
# 	p[:long] = x["the_geom"]["coordinates"][1]
# 	prog = Program.create(p)
# 	puts prog.id
# 	if x["academics"] == "yes"
# 		t = Tag.find_by(name: "academics")
# 		Programtag.create({
# 			program_id: prog.id,
# 			tag_id: t.id
# 			})
# 	end
#
# 	if x["arts_cultu"] == "yes"
# 		t1 = Tag.find_by(name: "arts")
# 		t2 = Tag.find_by(name: "culture")
# 		Programtag.create({
# 			program_id: prog.id,
# 			tag_id: t1.id
# 			})
# 		Programtag.create({
# 			program_id: prog.id,
# 			tag_id: t2.id
# 			})
# 	end
#
# 	if x["elementary"] == "yes"
# 		t = Tag.find_by(name: "elementary")
# 		Programtag.create({
# 			program_id: prog.id,
# 			tag_id: t.id
# 			})
# 	end
#
# 	if x["evenings"] == "yes"
# 		t = Tag.find_by(name: "evenings")
# 		Programtag.create({
# 			program_id: prog.id,
# 			tag_id: t.id
# 			})
# 	end
#
# 	if x["high_schoo"] == "yes"
# 		t = Tag.find_by(name: "high school")
# 		Programtag.create({
# 			program_id: prog.id,
# 			tag_id: t.id
# 			})
# 	end
#
# 	if x["middle_sch"] == "yes"
# 		t = Tag.find_by(name: "middle school")
# 		Programtag.create({
# 			program_id: prog.id,
# 			tag_id: t.id
# 			})
# 	end
#
# 	if x["summer"] == "yes"
# 		t = Tag.find_by(name: "summer")
# 		Programtag.create({
# 			program_id: prog.id,
# 			tag_id: t.id
# 			})
# 	end
#
# 	if x["school_yea"] == "yes"
# 		t = Tag.find_by(name: "school year")
# 		Programtag.create({
# 			program_id: prog.id,
# 			tag_id: t.id
# 			})
# 	end
#
# 	if x["weekends"] == "yes"
# 		t = Tag.find_by(name: "weekends")
# 		Programtag.create({
# 			program_id: prog.id,
# 			tag_id: t.id
# 			})
# 	end
#
# 	if x["sports_phy"] == "yes"
# 		t = Tag.find_by(name: "sports")
# 		Programtag.create({
# 			program_id: prog.id,
# 			tag_id: t.id
# 			})
# 	end
#
# end

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

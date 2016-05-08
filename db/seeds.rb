require 'csv'
require 'json'

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
	p[:organization] = row[:organization]
	p[:address] = row[:full_address]
	p[:email] = row[:email]
	p[:phone] = row[:phone]
	p[:website] = row[:url]
	p[:description] = row[:description]
	p[:lat] = row[:point_x].to_f
	p[:long] = row[:point_y].to_f
	p[:approval] = "approved"
	prog = Program.create!(p)
end

users = '{
  "staff" : [ {
    "first_name" : "emma",
    "last_name" : "morgan",
    "ref_id" : "1b3353c3-9b7d-4d50-bd36-cb7c19bc79d8",
    "user_name" : "emma_morgan_teacher_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  } ],
  "students" : [ {
    "first_name" : "emma",
    "last_name" : "morgan",
    "ref_id" : "374a7cba-35c9-4deb-bca6-7d97dcc3483f",
    "user_name" : "emma_morgan_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "joseph",
    "last_name" : "dean",
    "ref_id" : "4e213a19-785e-4866-87dc-05e6afaa4801",
    "user_name" : "joseph_dean_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "arlene",
    "last_name" : "prescott",
    "ref_id" : "603ce205-72da-4d84-b503-5cfda7eae666",
    "user_name" : "arlene_prescott_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "marc",
    "last_name" : "barnes",
    "ref_id" : "28cebee4-3311-473d-9a97-19c208f65bcb",
    "user_name" : "marc_barnes_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "jose",
    "last_name" : "mcdonalid",
    "ref_id" : "6658def6-dc3b-4301-9ff3-aec53cd85f07",
    "user_name" : "jose_mcdonalid_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "erin",
    "last_name" : "riley",
    "ref_id" : "808cfe84-c98f-412e-9ac4-239b96ea4baf",
    "user_name" : "erin_riley_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "chris",
    "last_name" : "elliott",
    "ref_id" : "b6581c23-a6f6-47a4-bc3b-66a290813806",
    "user_name" : "chris_elliott_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "gertrude",
    "last_name" : "pena",
    "ref_id" : "6014ef47-7c1e-4979-bbd1-dc937fa44654",
    "user_name" : "gertrude_pena_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "jessie",
    "last_name" : "weaver",
    "ref_id" : "03aa7ee8-ad5a-412b-b40d-6e9dbcd80cb8",
    "user_name" : "jessie_weaver_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "bertha",
    "last_name" : "watts",
    "ref_id" : "7b0bec98-01ef-447c-b9ba-a92976359b33",
    "user_name" : "bertha_watts_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "edith",
    "last_name" : "young",
    "ref_id" : "f8e19c09-ca7f-4127-a4a0-0f9446947192",
    "user_name" : "edith_young_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "clyde",
    "last_name" : "brooks",
    "ref_id" : "9ee509fd-5258-41c7-9b05-bf104053002b",
    "user_name" : "clyde_brooks_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "cory",
    "last_name" : "marshall",
    "ref_id" : "ef2a6a84-bbaa-4cbc-9c0b-083c90587baa",
    "user_name" : "cory_marshall_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "regina",
    "last_name" : "wood",
    "ref_id" : "681ed1dc-573c-47b2-9d3b-a48907e95538",
    "user_name" : "regina_wood_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "anna",
    "last_name" : "mitchell",
    "ref_id" : "76a146bd-35c2-4780-9f4c-484a1fe7fe1a",
    "user_name" : "anna_mitchell_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "jennie",
    "last_name" : "newman",
    "ref_id" : "733a65f8-7cbc-457e-b438-9e7e92f0da52",
    "user_name" : "jennie_newman_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "same",
    "last_name" : "reynolds",
    "ref_id" : "67cb99a5-04ff-4c9c-a8fc-ac373ff31206",
    "user_name" : "same_reynolds_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "beverly",
    "last_name" : "mitchelle",
    "ref_id" : "1efe442d-c5eb-4c5d-a572-f44e6ca17586",
    "user_name" : "beverly_mitchelle_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "tamara",
    "last_name" : "gilbert",
    "ref_id" : "55fc564e-725c-4fce-b02c-76a1eace95dc",
    "user_name" : "tamara_gilbert_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  }, {
    "first_name" : "christine",
    "last_name" : "sims",
    "ref_id" : "e715a184-ddcf-4e7c-9e76-61ed92a47461",
    "user_name" : "christine_sims_student_c6afd43c-81a0-4a2f-a74b-0f7872f091a7.hmhco.com"
  } ]
}'

users = JSON.parse(users);
teachers = users["staff"]
students = users["students"]

teachers.each do |teacher|
	f_name = teacher["first_name"]
	l_name = teacher["last_name"]
 	User.create(first_name: f_name.capitalize, last_name: l_name.capitalize, email: f_name + l_name + "@example.com", password: "password", role: "teacher")
end

students.each do |student|
	f_name = student["first_name"]
	l_name = student["last_name"]
 	User.create(first_name: f_name.capitalize, last_name: l_name.capitalize, email: f_name + l_name + "@example.com", password: "password", role: "student")
end

popular_programs = Program.all.sample(200)
users = User.all

popular_programs.each do |program|
	(3 + rand(14)).times do
		user = users.sample
		user.programs << program unless user.programs.include?(program)
	end
end

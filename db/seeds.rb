r = HTTParty.get('https://data.cityofnewyork.us/resource/reni-g9vg.json')

Tag.create({name: "elementary"})
Tag.create({name: "academics"})
Tag.create({name: "arts"})
Tag.create({name: "culture"})
Tag.create({name: "evenings"})
Tag.create({name: "middle school"})
Tag.create({name: "summer"})
Tag.create({name: "sports"})
Tag.create({name: "high school"})
Tag.create({name: "school year"})
Tag.create({name: "weekends"})

r.each do |x|
	p = Hash.new
	p[:existing] = true
	p[:address] = x["address1"] + ", " + x["address2"]
	p[:agency] = x["agency_nam"]
	p[:phone] = x["agency_tel"]
	p[:boro] = x["site_boro"]
	p[:lat] = x["the_geom"]["coordinates"][0]
	p[:long] = x["the_geom"]["coordinates"][1]
	prog = Program.create(p)
	puts prog.id
	if x["academics"] == "yes"
		t = Tag.find_by(name: "academics")
		Programtag.create({
			program_id: prog.id,
			tag_id: t.id
			})
	end

	if x["arts_cultu"] == "yes"
		t1 = Tag.find_by(name: "arts")
		t2 = Tag.find_by(name: "culture")
		Programtag.create({
			program_id: prog.id,
			tag_id: t1.id
			})
		Programtag.create({
			program_id: prog.id,
			tag_id: t2.id
			})

	end

	if x["elementary"] == "yes"
		t = Tag.find_by(name: "elementary")
		Programtag.create({
			program_id: prog.id,
			tag_id: t.id
			})

	end
	
	if x["evenings"] == "yes"
		t = Tag.find_by(name: "evenings")
		Programtag.create({
			program_id: prog.id,
			tag_id: t.id
			})
	end
	
	if x["high_schoo"] == "yes"
		t = Tag.find_by(name: "high school")
		Programtag.create({
			program_id: prog.id,
			tag_id: t.id
			})
	end
	
	if x["middle_sch"] == "yes"
		t = Tag.find_by(name: "middle school")
		Programtag.create({
			program_id: prog.id,
			tag_id: t.id
			})

	end
	
	if x["summer"] == "yes"
		t = Tag.find_by(name: "summer")
		Programtag.create({
			program_id: prog.id,
			tag_id: t.id
			})
	end
	
	if x["school_yea"] == "yes"
		t = Tag.find_by(name: "school year")
		Programtag.create({
			program_id: prog.id,
			tag_id: t.id
			})

	end
	
	if x["weekends"] == "yes"
		t = Tag.find_by(name: "weekends")
		Programtag.create({
			program_id: prog.id,
			tag_id: t.id
			})

	end

	if x["sports_phy"] == "yes"
		t = Tag.find_by(name: "sports")
		Programtag.create({
			program_id: prog.id,
			tag_id: t.id
			})

	end


end
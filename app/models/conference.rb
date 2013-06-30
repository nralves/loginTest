class Conference < ActiveRecord::Base
  attr_accessible :begin, :end, :location, :logo, :name, :conference_id, :user_ids
  
  has_and_belongs_to_many :users
  has_many :blocks, :dependent => :destroy
  has_many :news, :dependent => :destroy
  has_many :participants, :dependent => :destroy
  
  accepts_nested_attributes_for :users
  mount_uploader :logo, AvatarUploader
  
   def name_and_date
    self.name + ' | ' + self.begin.to_formatted_s(:short)
   end
  
  
  
	############
	## Pre-conditions:
	##  -> Blocks (sessions) must have a unique name on one conference
	##  -> Tracks with the same name will be treated as one
	##  -> Events must have a unique name on one conference
	##	-> Lecturers must have a unique name on one conference
	##	-> On each CSV file you use the commas to separete each value. If you need to put commas on a value, put that
	##		value in quotes. Example: 'Maria,"Studied Foobar on England, Holland and Spain.",Professor'
	##	-> Be carful with spaces on the values Exemple: Good: "name,track" | Bad: "name, track"
	##	-> CSV files must be enconded on UTF-8
	############
  
	def self.import(file)
	
	##########################
	## Adicionar Conferencia #
	##########################
	# Step 1: convert the uploaded file object to a file name
	file_name = "CSVs/conference.txt"
	# Step 2: To get the input text and see if it's what you expect
	csv_file = File.read(file_name, {encoding: 'UTF-8'})
	
	c = Conference.new
	
		csv = CSV.parse(csv_file, :headers => true)
		csv.each do |row|
			c.name = row[0]
			c.begin = row[1]
			c.end = row[2]
			c.location = row[3]
			c.logo = File.open("CSVs/resources/" + row[4])#row[4]#
			c.save
		end
		
	############################
	## Adicionar participants #
	############################
	# Step 1: convert the uploaded file object to a file name
	file_name = "CSVs/participants.txt"
	# Step 2: To get the input text and see if it's what you expect
	csv_file = File.read(file_name, {encoding: 'UTF-8'})
	
		csv = CSV.parse(csv_file, :headers => true)
		csv.each do |row|
			participant = Participant.new
			participant.email = row[0]
			participant.conference_id = c.id
			participant.save
		end
	
		
		
		
		
	####################################################
	## Adicionar Blocos (sessoes) e respectivas Tracks #
	####################################################
		
		b_hash = {}
		# Step 1: convert the uploaded file object to a file name
		file_name = "CSVs/blockNtrack.txt"
		# Step 2: To get the input text and see if it's what you expect
		csv_file = File.read(file_name, {encoding: 'UTF-8'})
		
		csv = CSV.parse(csv_file, :headers => true)
		csv.each do |row|
		b = Block.new
			b.name = row[0]
			b.room = row[1]
			b.begin = row[2]
			b.end = row[3]
			
			#Track creation
			t = Track.find_by_name(row[4])
			if t.nil?
				t = Track.create!(:name => row[4])
			end
			
			b.conference_id = c.id
			b.track_id = t.id
			b.save
			b_hash[b.name] = b.id
		end
		
		
	######################
	## Adicionar Posters #
	######################
	p_hash = {}
	
	# Step 1: convert the uploaded file object to a file name
	file_name = "CSVs/posters.txt"
	# Step 2: To get the input text and see if it's what you expect
	csv_file = File.read(file_name, {encoding: 'UTF-8'})
		
		csv = CSV.parse(csv_file, :headers => true)
		csv.each do |row|
			p = Poster.new
			p.name = row[0]
			p.description = row[1]
			p.poster = File.open("CSVs/resources/posters/" + row[2])
			p.file = File.open("CSVs/resources/resumes/" + row[3])
			p.votes = 0
			p.block_id = b_hash[row[4]]
			p.save
			p_hash[p.name] = p.id
		end
		
		
	########################
	## Adicionar Lecturers #
	########################
	l_hash = {}
	
	# Step 1: convert the uploaded file object to a file name
	file_name = "CSVs/lecturers.txt"
	# Step 2: To get the input text and see if it's what you expect
	csv_file = File.read(file_name, {encoding: 'UTF-8'})
	
		csv = CSV.parse(csv_file, :headers => true)
		csv.each do |row|
			l = Lecturer.new
			l.name = row[0]
			l.title = row[1]
			l.organization = row[2]
			l.country = row[3]
			l.homepage = row[4]
			l.resume = row[5]
			l.image = File.open("CSVs/resources/lecturers/"+row[6])#row[6]#
			l.email = row[7]
			l.save
			l_hash[l.name] = l.id
		end
		
	######################
	## Adicionar Eventos #
	######################
	e_hash = {}
	
	# Step 1: convert the uploaded file object to a file name
	file_name = "CSVs/events.txt"
	# Step 2: To get the input text and see if it's what you expect
	csv_file = File.read(file_name, {encoding: 'UTF-8'})
	
	
	
		csv = CSV.parse(csv_file, :headers => true)
		csv.each do |row|
			e = Event.new
			e.name = row[0]
			e.abstract = row[1]
			e.block_id = b_hash[row[2]]
			e.file = File.open("CSVs/resources/events/" + row[3])
			e.save
			e_hash[e.name] = e.id
		end
		
	##################################
	## Adicionar Lecturers a Eventos #
	##################################
	
	# Step 1: convert the uploaded file object to a file name
	file_name = "CSVs/lecturers_events.txt"
	# Step 2: To get the input text and see if it's what you expect
	csv_file = File.read(file_name, {encoding: 'UTF-8'})

		# Get the current DB connection
		connection = ActiveRecord::Base.connection();
		
		csv = CSV.parse(csv_file, :headers => true)
		csv.each do |row|
			#insert into table
				connection.execute("Insert INTO events_lecturers (event_id, lecturer_id) VALUES(#{e_hash[row[0]]},#{l_hash[row[1]]});")
		end
		
		
		
	##################################
	## Adicionar Lecturers a Posters #
	##################################
	
	# Step 1: convert the uploaded file object to a file name
	file_name = "CSVs/lecturers_posters.txt"
	# Step 2: To get the input text and see if it's what you expect
	csv_file = File.read(file_name, {encoding: 'UTF-8'})

		# Get the current DB connection
		connection = ActiveRecord::Base.connection();
		
		csv = CSV.parse(csv_file, :headers => true)
		csv.each do |row|
			#insert into table
				connection.execute("Insert INTO lecturers_posters (lecturer_id, poster_id) VALUES(#{l_hash[row[0]]},#{p_hash[row[1]]});")
		end
	
	
		
	end
end

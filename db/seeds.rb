# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#encoding: utf-8 

# Get the current DB connection
connection = ActiveRecord::Base.connection();
connection.execute("Insert INTO events_lecturers (event_id, lecturer_id) VALUES
    (1, 5),
    (2, 6),
    (3, 7);")

lecturers = 
Lecturer.create(
				[
					{ name: 'Adelaide Parr', country: 'United Kingdom', organization: 'The University of Melbourne', resume: 'Adelaide Parr is a Records Analyst at the 
					University of Melbourne. Previously she has held roles at Victoria University and 
					the Public Records Office Victoria. Following ten years of teaching in Australia 
					and the UK, she joined the information profession having completed her Masters in 
					Information Management and Systems at Monash University. She is currently Convenor 
					of the Victorian Branch of the Australian Society of Archivists.', image: File.open(File.join(Rails.root, '/public/images/lecturers/JohnMcMillan-2013.jpg'))  }, 
					
					{ name: 'Alex McEwen', country: 'New Zealand', organization: 'Statistics New Zealand', resume: 'Android devAlex McEwen is an Information Analyst in the Information Management business unit at Statistics New Zealand. He is the  is the teams resident technologist and primarily works alongside the IT Operations business unit.
					Alexs background is in data analysis and technology. He came to Statistics NZ from a large IT outsourcer where he was a Knowledge Manager and previous roles involved systems and data analysis in other public sector organisations. He is currently working on projects to improve access to corporate information. ' },
					
					{ name: 'Andy Carnahan', country: 'Australia', organization: 'Australian Computer Society', resume: 'Andy Carnahan constantly wonders about things.  From how miraculous it is to watch frog spawn turn into tadpoles then frogs; to how to create better processes to unlock the knowledge stored inside our heads and our data repositories.
					He is a senior member of the Australian Computer Society and has worked in the Information and Communication Technology field for more than twenty years.  He has a Graduate Diploma in Applied Information Systems.
					 No stranger to challenging Record Keepings sacred cows, Andy spoke at the 2008 RMAA National Conference on the theme that The Record Keeper is dead, he presented a workshop in Wellington in September 2012 on the topic of Enterprise Context Management and recently spoke at the AIIM conference in New Orleans on todays topic Big Data needs Big Classification' },
					
					{ name: 'Anne Cornish', country: 'Australia', organization: 'Records Solutions', resume: 'Anne Cornish is Records Solutions Principal Consultant and company owner. Having worked in the Records and Information Management (RIM) industry for almost 30 years and with 15 years experience as a consultant, Anne has been at the forefront of many changes in the industry.
					Anne firmly believes the next major shift in record keeping operations will revolve around a significant increase in the utilisation and management of digital records regardless of whether they are born digitally or created via a digitisation process. Her work over the past few years has therefore focused on the reduction of reliance on hard copy and the development of digitisation processes that meet compliance requirements and provide operational benefits.
					Anne has worked on and led many major RIM projects with clients in sectors including all 3 tiers of government, Education, Mining and Exploration, Health, Manufacturing, Accounting and Finance, Superannuation, Not-for-Profits and Charities, Energy, Science and Research and Utilities (gas, water, electricity).
					Anne has also been actively involved in the industry as a representative of RIMPA for over
					20 years and was selected by her peers to represent Australia in the development of
					ISO46/SC11 International Standard on Records Management (now known as ISO 15489).' },
					
					{ name: 'Stephen Ludlow', country: 'Canada', organization: 'OpenText', resume: 'Stephen Ludlow leads OpenTexts eDiscovery and Information Governance practice.  He helps customers transform the way they manage information.  By working closely with OpenText  sales, services and RandD, he ensures that customers address compliance and litigation risks, storage and eDiscovery costs, all while deriving maximum value from the their information assets.
					Prior to leading OpenTexts eDiscovery practice, Mr. Ludlow managed Open Texts Risk Management and Compliance application, working with Fortune 500 companies to deploy enterprise solutions for Internal Controls and Sarbanes Oxley compliance.
					Before joining OpenText, Stephen was an Information Management consultant focused on Canadian Federal Government clients.' },
					
					{ name: 'John McMillan', country: 'Australia', organization: 'Office of the Australian Information Commissioner', resume: 'Professor John McMillan AO was appointed Australian Information Commissioner in November 2010, to head a new office responsible for freedom of information, privacy protection and advice to government on information management policy.
					John was formerly the Commonwealth Ombudsman from 2003x2010; and the Integrity Commissioner (Acting) for the Australian Commission for Law Enforcement Integrity in 2007. He is an Emeritus Professor of the Australian National University. He is co-author of a leading student text, Control of Government Action.
					John was a founding member in the 1970s of the Freedom of Information Campaign Committee, which led the public campaign for enactment of the Freedom of Information Act 1982. He is a National Fellow of the Institute of Public Administration Australia; a Fellow of the Australian Academy of Law; and former President of the Australian Institute of Administrative Law.' },
					
					{ name: 'Rory Staunton', country: 'United Kingdom', organization: 'Strategy Partners', resume: 'Recognised as a leading IT  industry analyst in Europe, Rory has provided extensive IT advisory services to major European and North American organisations in the governmental, pharmaceutical, finance, and utility sectors. He is also a much sought-after speaker at conferences and frequently consults at Board level on IT strategy. 
					Prior to founding Strategy Partners, Rory was Research Director at Gartner Group Europe, responsible for establishing Gartners Integrated Document and Output Management (IDOM) service in Europe. 
					Previously, Rory was Information Systems Manager at Imperial Chemical Industries (ICI) where he was responsible for technical computing projects, generating IT strategy, performing cost/benefit analyses, running its records management services and implementing image processing and document production systems. 
					Rory is formally a International Board member and is a Fellow of AIIM International, the USA-based Association for Enterprise Content Management, and is member of the Executive Committee of the DLM Forum, the European Commission-sponsored body that generates information standards in Europe. ' }
					
				]
				)
				
conferences =
Conference.create(
				 [
					{name:'Inforum 2015', begin:'2015-06-06 15:30', end:'2015-06-06 16:30', location:'Castelo Branco', logo:'inf2015.jpg'},
					{name:'IEEE 2014', begin:'2015-06-06 15:30', end:'2015-06-06 16:30', location:'Beja', logo:'inf2014.jpg'},
					{name:'ICFIE 2013', begin:'2013-06-22 03:23:00', end:'2013-06-23 03:23:00', location:'Kanyakumari, India', logo:'icfie13.jpg'},
					
					{name:'inForum 2013', begin:'2013-09-08', end:'2013-09-11', location:' Canberra, Australia'}

				 ]
				 )
				 
bloacks =
Block.create(
			[
				{name:'Keynote', room:'Royal Theatre', begin:'2013-09-10 09:00', end:'2013-09-10 09:40', conference_id: '4'},
				
				{name:'Keynote', room:'Royal Theatre', begin:'2013-09-09 08:50', end:'2013-09-09 09:30', conference_id: '4'},
				
				{name:'Keynote', room:'Royal Theatre', begin:'2013-09-11 14:45', end:'2013-09-11 15:25', conference_id: '4'}
			]
			)
				 
events =
Event.create(
			[
				{name:'Evolving RM to Information Governance to Protect Your Organization', abstract:'Have Records Managers been fooling themselves into believing that they have content under control?  Is simply managing & official records enough to protect the interests of the organization?  With the pervasiveness of electronic content, new risks like Intellectual Property loss, fraud, and corruption can be detected in content and controlled with sound Information Governance policies.   As Records Management and IT best practices converge towards Information Governance, new strategies for capturing and classifying more than just the official records need to be explored.', block_id: '1'},
				
				{name:'Information regulation and new challenges', abstract:'Information is a core asset that must be managed effectively. An organisations success can depend on its skill and efficiency in assembling, organising, retrieving, understanding, acting on, safeguarding and sharing information.
				The Office of the Australian Information Commissioner (OAIC) has a particular interest in three dimensions of that challenge. One is to ensure that government agencies manage information as a national resource that can be re-used outside agencies by business and the community. The true value of information is realised only when others can use and build upon it to create new ideas, inventions and strategies. Open public sector information (PSI) is the necessary policy setting to make that happen
				Another OAIC responsibility is to ensure that personal information is managed in compliance with privacy and data protection laws and codes. Stronger legal regulation, that includes harsher penalties for privacy breaches, is due to commence in March 2014. The new laws apply uniform privacy principles to government and private sector agencies.
				The third OAIC responsibility is to promote and safeguard the publics right of access to government information under freedom of information laws. Though thirty years old, the FOI Act throws up new issues and challenges in a digital age.', block_id: '2'},
				
				{name:'Always-on compliance: The value proposition for information governance', abstract:'A fundamental change of mindset is needed to address the needs of ever-demanding Regulators in all government and commercial organisations. Every employee must get ahead of the Compliance curve by making compliance an everyday, routine, Always-On part of the culture and infrastructure. This is the key to Information Governance which defines the set of integrated techniques, practices, policies, standards and systems that directs the purchase, design, implementation and usage of all information systems, so that they are  fit for purpose in meeting compliance regulations, at the lowest available cost.
				The systems and services that will emerge require organisations to assess the value and risk of their information from cradle to grave, not just when archiving.  This requirement will massively increase the value of Records Managers that embrace the discipline needed to record boxes of paper and extend it to manage cloud systems that span every regulatory reporting requirement that CEOs need, to keep them out of prison.
				The presentation will show how the coincidence and combination of the recession in Europe; new technologies including cloud and  mobile; increased regulation and new approaches to records management have created opportunities for records managers to bring their expertise  to  businesses and IT in a proactive way.  It will address:
				Technically, What Information Governance looks like and how it enables organisations to control  their information
				Operationally: How organisations can comply with current and new regulations without 99% boredom or ignorance, 1% blind panic
				Financially: How organisations can compete, in manufacturing mining, pharmaceutical, government HR,  environmental and financial regulations', block_id: '3'}
			]
			)			
			
			
news =
News.create(
			[
				{title:'Its started!!!', body:' A conferencia ICFIE 2013 esta prestes a comecar.', conference_id:'3'}
			
			]
			)
			

				
				

users =
User.create(
			[
			{email:'nralves@campus.fct.unl.pt', password:'1234', title:'', name:'Nuno Alves', organization:'FCT-UNL', homepage:'nuno.fct.unl.pt', photo: 'me.jpg'}
			]
			)
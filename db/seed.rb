puts 'Seeding Database...'
[
  { en: 'Art'},
  { en: 'Visual Arts'},
  { en: 'Circus' },
  { en: 'Community' },
  { en: 'Humor' },
  { en: 'Comicbooks' },
  { en: 'Dance' },
  { en: 'Design' },
  { en: 'Events' },
  { en: 'Fashion' },
  { en: 'Gastronomy' },
  { en: 'Film & Video' },
  { en: 'Games' },
  { en: 'Journalism' },
  { en: 'Music' },
  { en: 'Photography' },
  { en: 'Science & Technology' },
  { en: 'Theatre' },
  { en: 'Sport' },
  { en: 'Web' },
  { en: 'Carnival' },
  { en: 'Architecture & Urbanism' },
  { en: 'Literature' },
  { en: 'Mobility & Transportation' },
  { en: 'Environment' },
  { en: 'Social Business' },
  { en: 'Education' },
  { en: 'Fiction Films' },
  { en: 'Documentary Films' },
  { en: 'Experimental Films' },
  { en: 'Health'}
].each do |name|
   category = Hatchy::Category.find_or_initialize_by(name: name[:en ])
   category.save
 end

bank = Hatchy::Bank.find_or_initialize_by(name:"Fake Bank", code:"69")
bank.save

bank2 = Hatchy::Bank.find_or_initialize_by(name:"Fake Second Bank", code:"96")
bank2.save
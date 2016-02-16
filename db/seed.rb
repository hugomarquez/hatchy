puts 'Seeding Database...'
[
  { en: 'Web' },
  { en: 'Social Business' },
  { en: 'Education' },
  { en: 'Health'}
].each do |name|
   category = Hatchy::Category.find_or_initialize_by(name: name[:en ])
   category.save
 end

bank = Hatchy::Bank.find_or_initialize_by(name:"Fake Bank", code:"1")
bank.save

bank2 = Hatchy::Bank.find_or_initialize_by(name:"Fake Second Bank", code:"2")
bank2.save
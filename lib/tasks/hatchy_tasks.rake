namespace :hatchy do 
  
  desc "Load seed data for Hatchy Engine"
    task :seed => :environment do
      require File.join(Hatchy.root, 'db', 'seed')
    end

  desc "Import default set of countries"
    task :import_countries => :environment do
      Hatchy::CountryImporter.import
    end

  desc "Create a default admin user"
    task :create_admin_user => :environment do 
      Hatchy::User.create(email:'admin@example.com', password:'password', password_confirmation:'password', first_name:'Default', last_name:'Admin', admin: true)
      puts "    New user has been created successfully."
      puts
      puts "    E-Mail Address..: admin@example.com"
      puts "    Password........: password"
    end

  desc "Run the setup task for a new application"
    task :setup => :environment do
      Rake::Task["hatchy:seed"].invoke
      Rake::Task["hatchy:import_countries"].invoke if Hatchy::Country.all.empty?
      Rake::Task["hatchy:create_admin_user"].invoke if Hatchy::User.all.empty?
    end
end
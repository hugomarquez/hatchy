namespace :hatchy do 
  
  desc "Load seed data for Hatchy Engine"
    task :seed => :environment do
      require File.join(Hatchy.root, 'db', 'seed')
    end

   desc "Import default set of countries"
    task :import_countries => :environment do
      Hatchy::CountryImporter.import
    end

  desc "Run the setup task for a new application"
    task :setup => :environment do
      Rake::Task["hatchy:seed"].invoke
      Rake::Task["hatchy:import_countries"].invoke if Hatchy::Country.all.empty?
    end
end
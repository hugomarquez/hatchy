$:.push File.expand_path("../lib", __FILE__)

require "hatchy/version"

Gem::Specification.new do |s|
  s.name        = "hatchy"
  s.version     = Hatchy::VERSION
  s.authors     = ["Hugo Marquez"]
  s.email       = ["hugomarquez.dev@gmail.com"]
  s.homepage    = "https://github.com/hugomarquez/hatchy"
  s.summary     = "The first open source crowdfunding platform from Mexico"
  s.description = "Open-source crowdfunding platform"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1.14"
  s.add_dependency "devise", "3.5.1"
  s.add_dependency "jquery-rails", ">= 3", "< 4.1"
  s.add_dependency "haml", ">= 4.0", "< 5.0"
  s.add_dependency "haml-rails", "0.9.0"
  s.add_dependency "carrierwave", "0.10.0"
  s.add_dependency "video_info", "2.5.0"
  s.add_dependency "pundit", "1.0.1"
  s.add_dependency "kaminari", ">= 0.16.3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "thin", "1.6.4"
  s.add_development_dependency "sass-rails", "~> 4.0"
end

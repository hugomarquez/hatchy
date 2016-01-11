module Hatchy
  class Engine < ::Rails::Engine
    isolate_namespace Hatchy

    config.generators do |g|
    	g.test_framework	:rspec, fixture: false
    	g.fixture_replacement :factory_girl, dir: 'spec/factories'
    	g.assets false
    	g.helper false
    	g.template_engine :haml 
    end

    # Adds migrations to host application
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s + File::SEPARATOR
        config.paths["db/migrate"].expanded.each do |path|
          app.config.paths["db/migrate"] << path
        end
      end
    end

    initializer 'Hatchy precompile hook', group: :all do |app|
      app.config.assets.precompile += %w(
        hatchy/hatchy.js
        hatchy/hatchy.css
        )
    end

    generators do
      require 'hatchy/setup_generator' 
    end
    
  end
end
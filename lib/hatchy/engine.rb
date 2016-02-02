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
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |path|
          app.config.paths["db/migrate"] << path
        end
      end
    end

    initializer 'Hatchy precompile hook', group: :all do |app|
      app.config.assets.precompile += %w(
        hatchy/admin.js
        hatchy/admin/dashboard.js
        hatchy/hatchy.js
        hatchy/home.js
        hatchy/dashboard.js
        hatchy/projects/show.js
        hatchy/projects/edit.js
        hatchy/projects/contributions/new.js
        hatchy/projects/contributions/edit.js
        hatchy/projects/posts/edit.js
        hatchy/users/edit.js
        hatchy/hatchy.css
        hatchy/admin.css
        )
    end    
  end
end

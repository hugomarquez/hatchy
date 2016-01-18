require 'rails/generators'
module Hatchy::Generators
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)
    
    def create_route
      route 'mount Hatchy::Engine => "/"'
    end

    def copy_initializer
    	template "hatchy.rb", "config/initializers/hatchy.rb"
    end

    def copy_locale
    	copy_file "../../../config/locales/en.yml", "config/locales/hatchy.en.yml"
    	copy_file "../../../config/locales/devise.en.yml", "config/locales/devise.en.yml"
    end

    def copy_devise_initializer
      copy_file "../../../config/initializers/devise.rb", "config/initializers/devise.rb"
    end

  end
end
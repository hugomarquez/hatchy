require 'rails/generators'
module Hatchy
  class SetupGenerator < Rails::Generators::Base
    
    def create_route
      route 'mount Hatchy::Engine => "/"'
    end

  end
end
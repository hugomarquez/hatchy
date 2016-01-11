require "sass-rails"
require "jquery-rails"
require "haml"
require "haml-rails"
require "devise"
require "carrierwave"
require "video_info"
require "pundit"
require "web-console"
require "kaminari"
require "hatchy/engine"

module Hatchy
	autoload :CountryImporter, 'hatchy/country_importer'
	
	class << self
		def root
      File.expand_path('../../', __FILE__)
    end
	end

	mattr_accessor :theme
	@@theme = 'default'
end
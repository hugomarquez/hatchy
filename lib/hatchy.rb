require "sass-rails"
require "jquery-rails"
require "haml"
require "haml-rails"
require "devise"
require "carrierwave"
require "video_info"
require "pundit"
require "kaminari"
require "jquery-datatables-rails"
require "best_in_place"
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

  # Default way to setup Hatchy. Run rails generate hatchy_install to create
  # a fresh initializer with all configuration values.
  def self.setup
  	yield self
  end

end
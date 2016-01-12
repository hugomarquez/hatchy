module Hatchy
  class Bank < ActiveRecord::Base
    validates :name, :code, presence: true
    validates_uniqueness_of :code
  end
end

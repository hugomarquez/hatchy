module Hatchy
	class Country < ActiveRecord::Base
		has_many :users, class_name:'Hatchy::User'
	end
end

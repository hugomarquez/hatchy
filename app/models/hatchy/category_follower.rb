module Hatchy
	class CategoryFollower < ActiveRecord::Base
		belongs_to :category, class_name:'Hatchy::Category'
		belongs_to :user, 		class_name:'Hatchy::User'
		validates :category, 	uniqueness: {scope: :user}
	end
end

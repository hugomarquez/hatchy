module Hatchy
	class UserPolicy < ApplicationPolicy
		def edit?
			user_or_admin?
		end

		def update?
			user_or_admin?
		end

		protected
		def user_or_admin?
			record == user || user.try(:admin?)
		end
	end
end
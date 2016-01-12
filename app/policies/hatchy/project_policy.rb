module Hatchy
	class ProjectPolicy < ApplicationPolicy
		def create?
			owner_or_admin?
		end

		def update?
			create?
		end

		def send_to_analysis?
			create?
		end

		def publish?
			create? && record.approved?
		end
		
	end
end
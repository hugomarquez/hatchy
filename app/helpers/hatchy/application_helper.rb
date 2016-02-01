module Hatchy::ApplicationHelper
	
	def number_of_projects_created(user)
		"#{user.projects.count} projects created"
	end

	def number_of_projects_funded(user)
		"#{user.contributions.count} projects funded"
	end

end

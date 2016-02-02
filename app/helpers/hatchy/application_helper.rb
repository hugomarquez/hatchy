module Hatchy::ApplicationHelper
	
	def number_of_projects_created(user)
		"#{user.projects.count} projects created"
	end

	def number_of_projects_funded(user)
		"#{user.contributions.count} projects funded"
	end

	def authorized_posts(current_user, project)
		if current_user
			if !current_user.contributions.where(project: project).empty? || current_user == project.user || current_user.admin?
				@posts = project.posts.order('created_at DESC')
			else
				@posts = @project.posts.where(private: false).order('created_at DESC')
			end
		else
			@posts = @project.posts.where(private: false).order('created_at DESC')
		end
	end

end

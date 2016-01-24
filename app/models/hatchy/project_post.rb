module Hatchy
  class ProjectPost < ActiveRecord::Base
  	belongs_to :project, class_name:'Hatchy::Project'
  	belongs_to :user, class_name:'Hatchy::User'

  	validates_presence_of :user, :project, :content, :title

  	before_validation :set_user
  	before_save :set_user

  	private
  	def set_user
  		self.user_id = self.project.try(:user_id)
  	end
  end
end

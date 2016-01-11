module Hatchy
  class Category < ActiveRecord::Base

  	has_many :projects, class_name:'Hatchy::Project'
  	has_many :category_followers
  	has_many :users, through: :category_followers
  	validates :name, presence: true, uniqueness: true

  	def self.with_projects
  		where("exists(select * from hatchy_projects where hatchy_projects.category_id = hatchy_categories.id and hatchy_projects.status not in('draft', 'rejected'))")
  	end
  	
  	def total_projects
  		@total_projects ||= self.projects.where(status:'online').count
  	end

  end
end

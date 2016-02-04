module Hatchy
	class ContributionsDatatable < Hatchy::ApplicationDatatable
		delegate :params, :link_to, :check_box, :number_to_currency, to: :@view

		def initialize(view)
			@view = view
		end

		def as_json(options = {})
			{
				draw: params[:draw].to_i,
				recordsTotal: Hatchy::Contribution.count,
				recordsFiltered: contributions.count,
				data: data
			}
		end

		private

	  def data
	  	contributions.map do |contribution|
	      [
	      	contribution.id,
	      	link_to(contribution.project.name, admin_project_path(contribution.project)),
	      	link_to(contribution.project.user.username, admin_user_path(contribution.project.user)),
	      	link_to(contribution.user.username, admin_user_path(contribution.user)),
	      	number_to_currency(contribution.reward.min_value),
	      	number_to_currency(contribution.value),
	      	contribution.status,
	      	(
	        	content_tag :ul, class:'inline list-inline' do 
	        		content_tag :li, title:'info', rel:'tooltip', class:'pull-right' do
	        			link_to admin_contribution_path(contribution) do 
	        				content_tag :i, class:'fa fa-lg fa-info-circle' do 
	        					content_tag :span, style:'display:none;' do 
	        						"info"
	        					end
	        				end
	        			end
	        		end
	        	end
	        	)
	      ]
	    end
	  end

	  def contributions
	    @contributions ||= fetch_contributions
	  end

	  def fetch_contributions
	    contributions = Hatchy::Contribution.order("#{sort_column} #{sort_direction}")
	    contributions = contributions.page(page).per(per_page)
	    if params[:search][:value].present? && !params[:search][:value].blank?
	      contributions = contributions.where("name like :search or status like :search", search: "%#{params[:search][:value]}%")
	    end
	    contributions
	  end

	  def page
	    params[:displayStart].to_i/per_page + 1
	  end

	  def per_page
	    params[:pageLength].to_i > 0 ? params[:pageLength].to_i : 10
	  end

	  def sort_column
	    columns = %w[id project user reward value status anonymous]
	    hash = params[:order]
	    columns[hash.flatten[1]["column"].to_i]
	  end

	  def sort_direction
	    hash = params[:order]
	  	hash.flatten[1]["dir"] == "desc" ? "desc" : "asc"
	  end
	end
end
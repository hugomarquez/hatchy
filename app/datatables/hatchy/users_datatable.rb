module Hatchy
	class UsersDatatable < Hatchy::ApplicationDatatable
		delegate :params, :h, :link_to, :check_box, :number_to_currency, to: :@view

		def initialize(view)
			@view = view
		end

		def as_json(options = {})
			{
				draw: params[:draw].to_i,
				recordsTotal: Hatchy::User.count,
				recordsFiltered: users.count,
				data: data
			}
		end

		private

	  def data
	  	users.map do |user|
	      [
	      	user.id,
	      	user.first_name,
	      	user.last_name,
	      	check_box("admin", user.admin, checked: user.admin, disabled: true),
	        link_to(user.email, user),
	        user.phone,
	        user.mobile,
	        (
	        	content_tag :ul, class:'inline list-inline' do 
	        		content_tag :li, title:'info', rel:'tooltip', class:'pull-right' do
	        			link_to admin_user_path(user) do 
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

	  def users
	    @users ||= fetch_users
	  end

	  def fetch_users
	    users = Hatchy::User.order("#{sort_column} #{sort_direction}")
	    users = users.page(page).per(per_page)
	    if params[:search][:value].present? && !params[:search][:value].blank?
	      users = users.where("email like :search", search: "%#{params[:search][:value]}%")
	    end
	    users
	  end

	  def page
	    params[:displayStart].to_i/per_page + 1
	  end

	  def per_page
	    params[:pageLength].to_i > 0 ? params[:pageLength].to_i : 10
	  end

	  def sort_column
	    columns = %w[id first_name last_name admin email phone mobile]
	    hash = params[:order]
	    columns[hash.flatten[1]["column"].to_i]
	  end

	  def sort_direction
	  	hash = params[:order]
	  	hash.flatten[1]["dir"] == "desc" ? "desc" : "asc"
	  end
	end
end
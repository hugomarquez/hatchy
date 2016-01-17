module Hatchy
	class UsersDatatable
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
	      	link_to(user.id, "/admin/users/#{user.id}"),
	      	check_box("admin", user.admin, checked: user.admin, disabled: true),
	      	user.first_name,
	      	user.last_name,
	        link_to(user.email, user),
	        user.document,
	        user.phone,
	        user.mobile,
	        check_box("newsletter", user.newsletter, checked: user.newsletter, disabled: true),
	        user.sign_in_count,
	        user.last_sign_in_at.strftime("%m/%d/%Y - %l:%M%p"),
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
	    columns = %w[id admin first_name last_name email document phone mobile newsletter sign_in_count last_sign_in_at]
	    hash = params[:order]
	    columns[hash.flatten[1]["column"].to_i]
	  end

	  def sort_direction
	  	hash = params[:order]
	  	hash.flatten[1]["dir"] == "desc" ? "desc" : "asc"
	  end
	end
end
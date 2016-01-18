module Hatchy
	class ContributionsDatatable
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
	      	link_to(contribution.id, "/admin/contributions/#{contribution.id}"),
	      	link_to(contribution.project.name, contribution.project),
	      	link_to(contribution.user.full_name, "/admin/users/#{contribution.user.id}"),
	      	link_to(contribution.reward.id, "#"),
	      	check_box("Anonymous", contribution.anonymous, checked: contribution.anonymous, disabled: true),
	      	contribution.ip_address,
	      	contribution.card_type,
	      	number_to_currency(contribution.value),
	      	contribution.status
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
	    columns = %w[id project user reward anonymous ip_address card_type value status]
	    hash = params[:order]
	    columns[hash.flatten[1]["column"].to_i]
	  end

	  def sort_direction
	    hash = params[:order]
	  	hash.flatten[1]["dir"] == "desc" ? "desc" : "asc"
	  end
	end
end
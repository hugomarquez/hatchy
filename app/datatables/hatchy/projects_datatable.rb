module Hatchy
  class ProjectsDatatable
    delegate :params, :h, :link_to, :check_box, :number_to_currency, to: :@view

    def initialize(view)
      @view = view
    end

    def as_json(options = {})
      {
        draw: params[:draw].to_i,
        recordsTotal: Hatchy::Project.count,
        recordsFiltered: projects.count,
        data: data
      }
    end

    private

    def data
      projects.map do |project|
        [
          link_to(project.id, "/admin/projects/#{project.id}"),
          check_box("Recommended", project.recommended, checked: project.recommended, disabled: true),
          link_to(project.name, project),
          link_to(project.user.full_name, project.user),
          project.category.name,
          project.city,
          project.status,
          number_to_currency(project.goal),
          project.send_to_draft_at.strftime("%m/%d/%Y - %l:%M%p"),
          project.online_days,
          project.online? ? project.online_date.strftime("%m/%d/%Y - %l:%M%p") : "-",
          project.online? ? project.expires_at.strftime("%m/%d/%Y - %l:%M%p") : "-",
        ]
      end
    end

    def projects
      @projects ||= fetch_projects
    end

    def fetch_projects
      projects = Hatchy::Project.order("#{sort_column} #{sort_direction}")
      projects = projects.page(page).per(per_page)
      if params[:search][:value].present? && !params[:search][:value].blank?
        projects = projects.where("name like :search", search: "%#{params[:search][:value]}%")
      end
      projects
    end

    def page
      params[:displayStart].to_i/per_page + 1
    end

    def per_page
      params[:pageLength].to_i > 0 ? params[:pageLength].to_i : 10
    end

    def sort_column
      columns = %w[id name city goal online_days online_date expires_at send_to_draft_at status recommended]
      hash = params[:order]
      columns[hash.flatten[1]["column"].to_i]
    end

    def sort_direction
      hash = params[:order]
      hash.flatten[1]["dir"] == "desc" ? "desc" : "asc"
    end
  end
end
module Hatchy
  class ProjectsDatatable < Hatchy::ApplicationDatatable
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
          project.id,
          check_box("Recommended", project.recommended, checked: project.recommended, disabled: true),
          link_to(project.name, project_path(project)),
          link_to(project.user.username, admin_user_path(project.user)),
          project.category.name,
          project.city,
          project.status,
          number_to_currency(project.goal),
          (
            content_tag :ul, class:'inline list-inline' do 
              content_tag :li, title:'info', rel:'tooltip', class:'pull-right' do
                link_to admin_project_path(project) do 
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
      columns = %w[id recommended name city goal]
      hash = params[:order]
      columns[hash.flatten[1]["column"].to_i]
    end

    def sort_direction
      hash = params[:order]
      hash.flatten[1]["dir"] == "desc" ? "desc" : "asc"
    end
  end
end
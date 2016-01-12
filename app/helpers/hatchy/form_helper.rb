module Hatchy::FormHelper
  def errors_for(form, field)
    content_tag(:p, form.object.errors[field].try(:first), class: 'help-block')
  end

  def form_group_for(form, field, opts={}, &block)
    label = opts.fetch(:label){true}
    has_errors = form.object.errors[field].present?
    content_tag :div, class: "form-group #{'has-error' if has_errors}" do 
      concat form.label(field, class: 'col-sm-2 control-label') if label
      concat capture(&block)
      concat errors_for(form, field)
    end
  end

  def form_disabled(f, attr)
    json_object = f.object.safe_params.to_json
    json_object.exclude? attr.to_s 
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, 'javascript:void(0)', class: "btn btn-default add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
  
end
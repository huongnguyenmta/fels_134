module ApplicationHelper
  def link_to_remove_fields label, f
    field = f.hidden_field :_destroy
    link = link_to label, "#", onclick: "remove_fields(this)", remote: true
    field + link
  end

  def link_to_add_fields label, f, association
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for association, new_object, child_index: "new_#{association}" do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to label, "#", onclick: "add_fields(this, \"#{association}\",
      \"#{escape_javascript(fields)}\")", class: "btn btn-default"
  end
end

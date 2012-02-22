module JsFunOnRails
  module JsFunOnRailsHelper
    def link_to_remove_parent_by_class(name, clas = 'fields', speed = 'fast')
      link_to_function(name, "remove_fields(this, '#{clas}','#{speed}')")
    end

    def add_new_object(f, association, partial, speed = 'fast')
      new_object = f.object.class.reflect_on_association(association).klass.new
      fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
        render(partial, :f => builder)
      end
      return "add_fields(this, '#{association}', '#{escape_javascript(fields)}', '#{speed}')"
    end
    
    def link_to_add_new_object(name, f, association, partial, speed = 'fast')
      js = add_new_object(f, association, partial, speed)
      link_to_function(name, js)
    end
  
    def link_to_show_items_by_id(name, ids, speed = 'fast')
      link_to_function(name, "show_fields_by_ids(#{ids}, #{speed})")
    end

    def link_to_hide_items_by_id(name, ids, speed = 'fast')
      link_to_function(name, "hide_fields_by_ids(#{ids}, #{speed})")
    end
     
    def link_to_show_hide_items_by_id(name, show_ids, hide_ids, speed = 'fast')
      show_js = "show_fields(#{show_ids}, #{speed});"
      hide_js = "hide_fields(#{hide_ids}, #{speed});"
      link_to_function(name,show_js+hide_js)
    end
    
    def link_to_render_and_hide_items(name, partial, hide_ids, f, speed = 'fast')
      field = render(partial, :f => f)
      show_js = "add_field(this, '#{association}_id', '#{escape_javascript(field)}, #{speed}');"
      hide_js = "hide_fields(#{hide_ids}, #{speed})"
      link_to_function(name,show_js+hide_js)
    end
  end
end

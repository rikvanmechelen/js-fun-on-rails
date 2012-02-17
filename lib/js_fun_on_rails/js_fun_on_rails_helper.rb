module JsFunOnRails
  module JsFunOnRailsHelper
    def blabla
      link_to_function("BLABLA", "alert('Jello world')")
    end

    def kaka 
      link_to_function("kaka", "alert('hello world');")
    end

    def link_to_remove_class(name, clas = 'fields', speed = 'slow')
      link_to_function(name, "remove_fields(this, '#{clas}','#{speed}')")
    end

    def link_to_add_fields(name, f, association, speed = 'slow')
      new_object = f.object.class.reflect_on_association(association).klass.new
      fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
        render(association.to_s.singularize + "_fields", :f => builder)
      end
      link_to_function(name, "add_fields(this, '#{association}', '#{escape_javascript(fields)}', '#{speed}')")
    end
  end
end

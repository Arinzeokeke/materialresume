module PostsHelper

	def link_to_add_fields(text, f, assoc)
		new_obj = f.object.send(assoc).klass.new
		id =new_obj.object_id
		fields = f.fields_for(assoc, new_obj, child_index: id ) do |builder| 
			render assoc.to_s + "_fields", builder: builder
		end
		link_to(text, '#', class: "add_fields", data: {id: id, field: fields.gsub('\n', '')})

		
	end
end

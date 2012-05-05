def errors(target)
	haml_tag :ul do
		for field_errors in target.errors do
			for error in field_errors do
				haml_tag :li, error
			end
		end
	end
end

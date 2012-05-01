require 'jsmin'

module Mark
	JS_PROTOCOL = 'javascript:'
	LIBRARIES = 
		{
			'none'=>'(function(){%s})();',
			'jquery'=>
<<JQUERY
(function() {
	var marklet = function($) {
		%s
	};
	var e = document.createElement('script');
	e.onload = function() { 
		var latest = jQuery.noConflict();
		var l = 'Loaded jQuery ' + jQuery.fn.jquery;
		if(typeof console == 'undefined') {
			alert(l);
		} else {
			console.info(l);
		}
		marklet(latest);
	};
 	e.setAttribute('type', 'text/javascript');
 	e.setAttribute('src', 'https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js');
	document.body.appendChild(e);
})();
JQUERY
		}
	def Mark.marklet(source,library)
		marklet = LIBRARIES[library] % [source]
		JSMin.minify(JS_PROTOCOL+marklet)
	end
end

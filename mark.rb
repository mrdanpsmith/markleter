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
	if (typeof jQuery == 'undefined') {
		var e = document.createElement('script');
		e.onload = function() { 
			jQuery.noConflict();
			var l = 'Loaded jQuery ' + jQuery.fn.jquery;
			if(typeof console == 'undefined') {
				alert(l);
			} else {
				console.info(l);
			}
			marklet(jQuery);
		};
 		e.setAttribute('type', 'text/javascript');
 		e.setAttribute('src', 'http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js');
		document.body.appendChild(e);
	}
})();
JQUERY
		}
	def Mark.marklet(source,library)
		marklet = LIBRARIES[library] % [source]
		JSMin.minify(JS_PROTOCOL+marklet)
	end
end

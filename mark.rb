require 'jsmin'

module Mark
	JS_PROTOCOL = 'javascript:'
	LIBRARIES = 
		{
			'none'=>'(function(){%s})();',
			'jquery'=>
<<JQUERY
(function(){
	var marklet = function($) {
		%s
	};
	var fireMarklet = function() {
		var latest=jQuery.noConflict();
		marklet(latest);
	};
	var e=document.createElement('script');
	if (navigator.appName == "Microsoft Internet Explorer") {
		e.onreadystatechange = fireMarklet;
	} else {
		e.onload = fireMarklet;
	}
	e.setAttribute('type','text/javascript');
	e.setAttribute('src','https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js');
	document.body.appendChild(e);
})();
JQUERY
		}
	def Mark.marklet(source,library)
		marklet = LIBRARIES[library] % [source]
		JSMin.minify(JS_PROTOCOL+marklet).split("\n").join("")
	end
end

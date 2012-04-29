require 'jsmin'

module Mark
	JS_PROTOCOL = 'javascript:'
	LIBRARIES = 
		{
			'none'=>'(function(){%s})();',
			'jquery'=><<JQUERY
(function(){
	// the version of jQuery we want
	var v = "1.7.2";

	// check prior inclusion and version
	if (window.jQuery === undefined || window.jQuery.fn.jquery < v) {
		var done = false;
		var script = document.createElement("script");
		script.src = "http://ajax.googleapis.com/ajax/libs/jquery/" + v + "/jquery.min.js";
		script.onload = script.onreadystatechange = function(){
			if (!done && (!this.readyState || this.readyState == "loaded" || this.readyState == "complete")) {
				done = true;
				initMyBookmarklet();
			}
		};
		document.getElementsByTagName("head")[0].appendChild(script);
	} else {
		initBookmarklet();
	}
	function initBookmarklet() {
		%s
	}
})();
JQUERY
		}
	def Mark.marklet(source,library)
		marklet = LIBRARIES[library] % [source]
		JSMin.minify(JS_PROTOCOL+marklet)
	end
end

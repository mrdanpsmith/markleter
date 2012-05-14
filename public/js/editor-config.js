window.onload = function() {
	var editorTextarea = document.getElementsByName("source")[0];
	var addSourceDiv = function() {
		var editorTextareaParent = editorTextarea.parentNode;
		var editorDiv = document.createElement("div");
		editorDiv.id = "source";
		editorTextareaParent.appendChild(editorDiv);
	};
	var setUpFormOnSubmit = function(editor) {
		var markleterForm = document.getElementsByTagName("form")[0];
		markleterForm.onsubmit = function() {
			editorTextarea.innerHTML = editor.getSession().getValue();
		};
	};
	var replaceTextarea = function() {
		editorTextarea.style.display = "none";
		addSourceDiv();
		var editor = ace.edit("source");
		setUpFormOnSubmit(editor);
		editor.getSession().setMode("ace/mode/javascript");
		editor.getSession().setValue(editorTextarea.innerHTML);
	};
	var getIEVersion = function() {
		var ua = window.navigator.userAgent;
		var msie = ua.indexOf("MSIE ");
		if (msie > 0) {
			return parseInt(ua.substring(msie+5, ua.indexOf(".", msie)));
		} else {
			return 0;
		}
	};
	var msie = getIEVersion();
	if (msie == 0 || msie > 7) {
		replaceTextarea();
	}
};

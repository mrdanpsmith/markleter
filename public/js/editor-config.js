window.onload = function() {
	var editorTextarea = document.getElementsByName("source")[0];
	editorTextarea.style.display = "none";
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
	addSourceDiv();
	var editor = ace.edit("source");
	setUpFormOnSubmit(editor);
	editor.getSession().setMode("ace/mode/javascript");
	editor.getSession().setValue(editorTextarea.innerHTML);
};

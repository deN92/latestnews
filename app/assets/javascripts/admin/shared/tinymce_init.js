//= require active_admin/base 
//= require tinymce

$(document).ready(function() {

	tinymce.init({
		selector: "textarea",
		plugins: [
				"advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
				"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
				"table contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker textpattern"
		],

		toolbar1: "fontselect fontsizeselect styleselect formatselect | forecolor backcolor | newdocument | removeformat",
		toolbar2: "bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | outdent indent | bullist numlist | table | template pagebreak",
		toolbar3: "InsertButton | preview searchreplace fullscreen | blockquote hr | subscript superscript | charmap emoticons | link unlink anchor | image media | code insertdatetime", 
		menubar: false,
		toolbar_items_size: 'small',

		style_formats: [
			{title: 'Bold text', inline: 'b'},
			{title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
			{title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
			{title: 'Example 1', inline: 'span', classes: 'example1'},
			{title: 'Example 2', inline: 'span', classes: 'example2'},
			{title: 'Table styles'},
			{title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
		],

		templates: [
			{title: 'Test template 1', content: 'Test 1'},
			{title: 'Test template 2', content: 'Test 2'}
		],

		setup: function() {
			$(".bbc_news").click(function(eventObject){
				var news_content = $("#" + $(this).attr("id") + " .bbc_link p").text();
				tinyMCE.execCommand('mceInsertContent', false, news_content);
			});	
		},
	});
});
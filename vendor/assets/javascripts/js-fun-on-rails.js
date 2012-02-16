function remove_fields(link, clas, speed) {
	$(link).previous("input[type=hidden]").value = "1";
	var field = $(link).closest("." + clas);
	field.hide(speed, function () {
		field.remove()
	});
}

function add_fields(link, association, content, speed) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g");
	add_field(link, content.replace(regexp, new_id));
}

function add_field(link, content, speed) {
	var c = $(content);
	$(link).parent().before(c);
	c.hide();
	c.show(speed);
}

function show_fields(ids, speed) {
	for ( var i=0, len=ids.length; i<len; ++i ){
		$('#'+ids[i]).show(speed);
	}
}

function hide_fields(ids, speed) {
	for ( var i=0, len=ids.length; i<len; ++i ){
		$('#'+ids[i]).hide(speed);
	}
}

function remove_content(c, speed) {
	$('#'+c).hide(speed, function () {
		$('#'+c).remove()
	});
}
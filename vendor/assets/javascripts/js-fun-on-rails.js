function remove_fields(link, clas, speed) {
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

function add_field(link, content) {
	var c = $(content);
	$(link).parent().before(c);
	c.hide();
}

function show_fields(ids, speed) {
	for ( var i=0, len=ids.length; i<len; ++i ){
		$('#'+ids[i]).show(speed);
	}
}

function hide_fields_by_ids(ids, speed) {
	for ( var i=0, len=ids.length; i<len; ++i ){
		$('#'+ids[i]).hide(speed);
	}
}

function remove_fields_by_ids(ids, speed) {
	for ( var i=0, len=ids.length; i<len; ++i ){
		$('#'+ids[i]).hide(speed, function () {
			$('#'+id).remove()
		});
	}
}

function remove_content_by_id(id, speed) {
	$('#'+id).hide(speed, function () {
		$('#'+id).remove()
	});
}

function show_content_by_id(id, speed) {
	$('#'+id).show(speed);
}
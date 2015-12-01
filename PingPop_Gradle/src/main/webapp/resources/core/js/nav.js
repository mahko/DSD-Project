$(document).on('ready page:load', function () {
$('#datetimepicker1').datetimepicker();
});

$(document).ready(function(){
    
	console.log("hi");
	hideAll();
	showPage('#intro');
});

function showPage(idstring) {
	hideAll();
	$(idstring).show();
}

function hideAll() {
	$("#intro").hide();
	$("#FriendsPage").hide();
	$("#CalendarPage").hide();
	$("#EventPage").hide();
}

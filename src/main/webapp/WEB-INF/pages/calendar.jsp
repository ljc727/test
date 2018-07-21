<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<link href='/resources/fullcalendar-2.5.0//fullcalendar.css' rel='stylesheet' />
	<link href='/resources/fullcalendar-2.5.0//fullcalendar.print.css' rel='stylesheet' media='print' />
	<link href='/resources/qtip//jquery.qtip.min.css' rel='stylesheet' />

	<script src='/resources/fullcalendar-2.5.0//lib/moment.min.js'></script>
	<script src='/resources/fullcalendar-2.5.0//lib/jquery.min.js'></script>
	<script src='/resources/fullcalendar-2.5.0/fullcalendar.min.js'></script>
	<script src='/resources/fullcalendar-2.5.0/lang/ko.js'></script>
	<script src='/resources/qtip/jquery.qtip.min.js'></script>

<script>

	$(document).ready(function() {
		
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				height: 300,
				right: 'month'
			},
			defaultDate: '${today}',
			editable: false,
			eventLimit: false // allow "more" link when too many events
			<c:if test="${not empty data}">
			,events: ${data}
		    ,eventClick: function(calEvent, jsEvent, view) {

		        alert('Event: ' + calEvent.title);
		        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
		        alert('View: ' + view.name);

		        // change the border color just for fun
		        $(this).css('border-color', 'red');
		        
		        

		    }
		    ,eventRender: function(event, element, view) {
		        element.qtip({ content: "My Event: " + event.title });
		    }
			</c:if>
			
		});

		
		
		
		$('.fc-next-button').click(function() {
			var date = $("#calendar").fullCalendar('getDate');
			location.href = "/calendar?day=" + date.format("YYYY-MM-DD")
		});     
		
		$('.fc-prev-button').click(function() {
			var date = $("#calendar").fullCalendar('getDate');
			location.href = "/calendar?day=" + date.format("YYYY-MM-DD")
		});
		
		
		$(".fc-other-month").text("");
		
	});

</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
	

</style>
</head>
<body>


	<div id='calendar'></div>

</body>
</html>

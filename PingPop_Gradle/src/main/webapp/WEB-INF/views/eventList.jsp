<!-- created by Yewon Kim -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="EventPage">
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Create new Event</button>

	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	  
	  	<div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Create New Event</h4>
	      </div>
	      <div class="modal-body">
	        <jsp:include page="eventCreate.jsp" flush="false"/>
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-default" data-dismiss="modal">Create</button>
	      </div>
	    </div>
	    
	  </div>
	</div>

</div>

<!-- created by Yewon Kim -->
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>PingPop</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="google-signin-client_id" content="47669424667-hlcoecnphdq6niaps7im9d9s8djfi8ae.apps.googleusercontent.com">
	
	<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss"/>
	<spring:url value="/resources/core/css/datepicker.css" var="datepickerCss"/>
	
	<spring:url value="/resources/core/css/custom.css" var="customCss"/>
	
	<link href="${bootstrapCss}" rel="stylesheet"/>
	<link href="${datepickerCss}" rel="stylesheet"/>
	
	<link href="${customCss}" rel="stylesheet"/>
	
</head>
<body style="padding-top:100px;padding-bottom:70px">
  	<jsp:include page="nav.jsp" flush="false"/>
  	<div class="main-container container">
  		<div id="intro">
  			<h3>Welcome to PingPop</h3>
	  		<h3><small>create your events and ask friends to join!</small></h3>
	  		<div class="user-wrapper"></div>
  		</div>
  		<jsp:include page="eventList.jsp" flush="false"/>
  		<jsp:include page="Friends.jsp" flush="false"/>
  		<jsp:include page="Calendar.jsp" flush="false"/>
  	</div>
  	
  	<spring:url value="/resources/core/js/pingpop-google-api.js" var="pingpopGoogleJs"/>
  	<spring:url value="/resources/core/js/jquery-1.11.3.min.js" var="jqueryJs"/>
	<spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs"/>
	<spring:url value="/resources/core/js/moment.js" var="momentJs"/>
	<spring:url value="/resources/core/js/bootstrap-datepicker.js" var="bootstrapDatePickerJs"/>
	
	<spring:url value="/resources/core/js/nav.js" var="navJs"/>
	
	
	<script src="${jqueryJs}"></script>
	<script src="${bootstrapJs}"></script>
	<script src="${momentJs}"></script>
	<script src="${bootstrapDatePickerJs}"></script>
	<script src="${navJs}"></script>
	
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	<script src="${pingpopGoogleJs}"></script>
	
</body>
</html>
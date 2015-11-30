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
	<link href="${bootstrapCss}" rel="stylesheet"/>
	
</head>
<body style="padding-top:50px;padding-bottom:70px">
  	<jsp:include page="nav.jsp" flush="false"/>
  	<div class="main-container container">
  		<h3>Welcome to PingPop</h3>
  		<h3><small>create your events and ask friends to join!</small></h3>
  		<div class="user-wrapper"></div>
  	</div>
  	
  	<spring:url value="/resources/core/js/pingpop-google-api.js" var="pingpopGoogleJs"/>
  	<spring:url value="/resources/core/js/jquery-1.11.3.min.js" var="jqueryJs"/>
	<spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs"/>
	<script src="${pingpopGoogleJs}"></script>
	<script src="${jqueryJs}"></script>
	<script src="${bootstrapJs}"></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	
</body>
</html>
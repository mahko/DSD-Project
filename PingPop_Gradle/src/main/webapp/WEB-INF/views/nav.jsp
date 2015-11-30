<!-- created by Yewon Kim -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="/PingPop_Gradle">PingPop</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li><a href="#">Calendar</a></li>
	        <li><a href="#">Friends</a></li>
	        <li><a href="#">Pop Event</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
		     <c:choose>
		        <c:when test="${ empty sessionScope.userLoginInfo }">
		        	<li><a id="my-signin2"></a></li>
		        </c:when>
		        <c:when test="${ not empty sessionScope.userLoginInfo }">
		        	<li>Welcome ${ sessionScope.userLoginInfo.userName } ~~</li>
		        	<li><a href="#" onclick="signOut();">Sign out</a></li>
		        	<script src="https://apis.google.com/js/platform.js?onload=onLoadAgain" async defer></script>
		        </c:when>
	        </c:choose>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>

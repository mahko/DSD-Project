/**
 * create by Yewon Kim
 * **/
var outh2;
function signOut() {
    auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
     // console.log('User signed out.');
      $.ajax({
    	  type : 'POST',
    	  url : 'logout',
    	  success:
    		  function(data, status) {
    		  	console.log("User signed out.");
    		  	location.reload();
	          }
      });
    });
}

function onSuccess(googleUser) {
      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
      location.reload();
      /*$.post("login", {
	        userId: googleUser.getBasicProfile().getId(),
	        userName: googleUser.getBasicProfile().getName(),
	        email: googleUser.getBasicProfile().getEmail()
	    },
	    function(data, status){
	        console.log("saved user session login info");
	    });*/
      $.ajax({
    	  type : 'POST',
    	  url : 'login',
    	  dataType : 'json',
    	  data: JSON.stringify({
    		  userId: googleUser.getBasicProfile().getId(),
    		  userName: googleUser.getBasicProfile().getName(),
    		  email: googleUser.getBasicProfile().getEmail()
    	  }),
    	  contentType : 'application/json',
    	  success:
    		  function(data, status) {
    		  	console.log("saved user session login info");
    		  	location.reload();
	          }
      });
}

function onFailure(error) {
  console.log(error);
}

function onLoad() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		auth2 = gapi.auth2.getAuthInstance();
		console.log(auth2);
		gapi.signin2.render('my-signin2', {
			//'scope': 'https://www.googleapis.com/auth/plus.login',
			'width': 100,
			'height': 25,
			'longtitle': false,
			'onsuccess': onSuccess,
			'onfailure': onFailure
		});
	});
}

function onLoadAgain() {
	gapi.signin2.render('my-signin2', {
		//'scope': 'https://www.googleapis.com/auth/plus.login',
		'width': 100,
		'height': 25,
		'longtitle': false,
		'onsuccess': onSuccess,
		'onfailure': onFailure
	});

}
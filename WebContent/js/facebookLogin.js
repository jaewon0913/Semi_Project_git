window.fbAsyncInit = function() {
	FB.init({
		appId : '452413625522628',
		cookie : true, // enable cookies to allow the server to access the session
		xfbml : true, // parse social plugins on this page
		version : 'v3.3' // use graph api version 2.8
	});
	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});
};

(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement(s);
	js.id = id;
	js.src = "https://connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}
(document, 'script', 'facebook-jssdk'));

function checkLoginState() {
	//alert("checkloginstate 도착");
	FB.getLoginStatus(function(response) {
		//alert("check : " + response);
		statusChangeCallback(response);
	});
}

function statusChangeCallback(response) {
	//alert("statuschangecallback 도착");
	console.log('statusChangeCallback');

	//alert("status : " + response);
	if (response.status === 'connected') {
		console.log(response.authResponse.accessToken);
		// Logged into your app and Facebook.
		//alert(response.stauts);
		testAPI();
	} else if (response.status === 'not_authorized') {
		document.getElementById('status').innerHTML = 'Please log '
				+ 'into this app.';
	} else {
		document.getElementById('status').innerHTML = 'Please log '
				+ 'into Facebook.';
	}

}

function testAPI() {
	//alert("testAPI 도착");
	console.log('Welcome! Fetching your information.... ');
	FB.api('/me', {
		"fields" : "id,name,email,birthday,gender"
	}, function(response) {
		// Insert your code here
		console.log('페북 아이디 : ' + response.id);
		console.log('페북 이름 : ' + response.name);

		var facebookid = response.id;
		var facebookname = response.name;

		 document.write('<form action="userlogin.do" id="sub_form" method="post">'+
		 '<input type="hidden" name="command" value="facebook">'+
		 '<input type="hidden" name="id" value="'+facebookid+'">'+
		'<input type="hidden" name="name" value="'+facebookname+'">'+
		 '</form>');
		 
		 
		 document.getElementById("sub_form").submit();
		 
	});
}

function fblogout() {

	FB.logout(function(response) {
		window.location.reload();
	});
}
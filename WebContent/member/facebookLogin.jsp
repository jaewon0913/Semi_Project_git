<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html;charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Page Title</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
   <script>
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

(function(d, s, id){
var js, fjs = d.getElementsByTagName(s)[0];
if (d.getElementById(id)) {return;}
js = d.createElement(s); js.id = id;
js.src = "https://connect.facebook.net/en_US/sdk.js";
fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

   
   function statusChangeCallback(response) {
    
      console.log('statusChangeCallback');

      if (response.status === 'connected') {
        console.log(response.authResponse.accessToken);
        // Logged into your app and Facebook.
        testAPI();
      } else if (response.status === 'not_authorized') {
        document.getElementById('status').innerHTML = 'Please log ' + 'into this app.';
      } else {
        document.getElementById('status').innerHTML = 'Please log ' + 'into Facebook.';
      }

  }

function checkLoginState() {
FB.getLoginStatus(function(response) {
statusChangeCallback(response);
});
}
  
function testAPI() {
  console.log('Welcome! Fetching your information.... ');
  FB.api(
    '/me',
    {"fields":"id,name,email,gender,birthday"},
    function(response) {
       // Insert your code here
      console.log('Successful login for: ' + response.name);

      document.getElementById('status').innerHTML = JSON.stringify(response);
    }
  );
}

function fblogout(){

  FB.logout(function(response) {
    window.location.reload();
  });
}

</script>

   <fb:login-button scope="public_profile,email"
      onlogin="checkLoginState();">
   </fb:login-button>

   <input type="button" onclick="javascript:fblogout();" value="로그아웃" />
   <div id="status" />

</body>
</html>
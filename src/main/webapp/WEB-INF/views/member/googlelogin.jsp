<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://accounts.google.com/gsi/client" async defer></script>
</head>
<body>
<script>
    function handleCredentialResponse(response) {
      console.log("Encoded JWT ID token: " + response.credential);
    }
    window.onload = function () {
      google.accounts.id.initialize({
        client_id: "339044029339-uhke0src7j98mqp928fvijnkrmhf3e06.apps.googleusercontent.com",
        callback: handleCredentialResponse
      });
      google.accounts.id.renderButton(
        document.getElementById("buttonDiv"),
        { theme: "outline", size: "large" }  // customization attributes
      );
      google.accounts.id.prompt(); // also display the One Tap dialog
    }
</script>
<div id="buttonDiv"></div> 
</body>
</html>
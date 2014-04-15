<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>Login MobiNxtGen</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
	<!-- Begin Page Content -->
	<div id="container">
		<form action="login" method="post">
			<label for="username">Username:</label>
			 <input type="text" id="userName" name="userName"> 
			 <label for="password">Password:</label>
			<input type="password" id="password" name="password">
					<div id="lower">
						<a href="/signup.jsp" class="newUser">New User</a> 
							<input type="submit" value="Login">
					</div>
					<!--/ lower-->
		</form>
	</div>
	<!--/ container-->
	<!-- End Page Content -->
</body>
</html>
<link rel="stylesheet" type="text/css" href="css/signup.css">
	<!-- Begin Page Content -->
	<div id="container">
		<form name="mainForm" action="signup" method="post">
			<label for="companyName">Company Name:</label> 
			<input type="text" id="companyName" name="companyName"> 
			<label for="address">Company Address:</label>
			<textarea cols="40" rows="5" name="address" id="address">Enter address Here!</textarea>
			<label for="userName">User Name:</label> 
			<input type="text" id="userName" name="userName"> 
			<label for="password">Password:</label>
			<input type="password" id="password" name="password">
			<label for="confirmPassword">Confirm Password:</label>
			<input type="password" id="confirmPassword" name="confirmPassword">
			<label for="emailAddress">Email Address:</label>
			<input type="email" id="emailAddress" name="emailAddress">
			<div id="lower">
				<input type="submit" value="Register">
			</div>
			<!--/ lower-->
		</form>
	</div>
	<!--/ container-->
	<!-- End Page Content -->

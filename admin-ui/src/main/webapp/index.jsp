<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Member Login Page</title>
</head>
<body>
	<form method="POST" action="login">
		<table>
			<tr>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>UserName :</td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<td>Password :</td>
				<td><input type="password" name="password"></td>
			</tr>

			<tr>
				<td colspan="3"><input type="submit" value="Login"></td>
			</tr>
		</table>
	</form>
	<form method="GET" action="login/signup">
	New User 
	<table>
			<tr>
				<td colspan="3"><input type="submit" value="Signup"></td>
			</tr>
		</table>
	</form>
</body>
</html>
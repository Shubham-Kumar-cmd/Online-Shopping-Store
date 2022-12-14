<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>


	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Your security Question successfully changed !</h3>
	<%
	}
	%>

	<%
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Your Password is wrong!</h3>
	<%
	}
	%>


	<%
	try {
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='" + email + "'");
		while (rs.next()) {
	%>
	<form action="changeSecurityQuestionAction.jsp" method="post">
		<h3>Select Your New Securtiy Question</h3>
		<select class="input-style" name="securityQuestion" required>
			<option value="What is the name of
				your favorite pet?">What
				is the name of your favorite pet?</option>
			<option value="In what city were you
				born?">In what
				city were you born?</option>
			<option value="What is the name of
				your first school?">What
				is the name of your first school?</option>
			<option value="What was your favorite
				food as a child?">What
				was your favorite food as a child?</option>
		</select>
		<hr>
		<h3>Enter Your New Answer</h3>
		<input class="input-style" type="text" name="newAnswer"
			placeholder="Your New Answer" required>
		<hr>
		<h3>Enter Password (For Security)</h3>
		<input class="input-style" type="password" name="password"
			placeholder="Enter Password(for Security)" required>
		<hr>
		<button class="button" type="submit">
			Save<i class='far fa-arrow-alt-circle-right'></i>
		</button>
	</form>
	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>

</body>
<br>
<br>
<br>
</html>
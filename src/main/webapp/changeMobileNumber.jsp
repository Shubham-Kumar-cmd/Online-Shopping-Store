<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Mobile Number</title>
</head>
<body>

	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Your Mobile Number successfully changed!</h3>
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

	<form action="changeMobileNumberAction.jsp" method="post">
		<h3>Enter Your New Mobile Number</h3>
		<input class="input-style" type="number" name="mobileNumber"
			placeholder="Your New Mobile Number" required>
		<hr>
		<h3>Enter Password (For Security)</h3>
		<input class="input-style" type="password" name="password"
			placeholder="Your Password (For Security)" required>
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
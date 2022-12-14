<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String securityQuestion = request.getParameter("securityQuestion");
String newAnswer = request.getParameter("newAnswer");
String password = request.getParameter("password");
try
{
	int check=0;
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	while(rs.next())
	{
		check=1;
		st.executeUpdate("update users set securityQuestion='"+securityQuestion+"', answer='"+newAnswer+"', password='"+password+"' where email='"+email+"'");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
	}
	if(check==0)
		response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
}
catch(Exception e)
{
	System.out.println(e);
}



/* this method is also true but not secure
try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con
	.prepareStatement("update users set securityQuestion=?, answer=?, password=? where email=? ");
	ps.setString(1, securityQuestion);
	ps.setString(2, newAnswer);
	ps.setString(3, newPassword);
	ps.setString(4, email);
	ps.executeUpdate();
	response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
}*/
%>
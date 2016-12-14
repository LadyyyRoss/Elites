<%--
  Created by IntelliJ IDEA.
  User: dominiqueross
  Date: 12/13/16
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import ="java.sql.*" %>
<%
    try{
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver").newInstance();  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dross5?"+ "user=dross5&password=1032187d");
        PreparedStatement pst = conn.prepareStatement("Select * from dross5.users where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();
        if(rs.next()) {
%>

<jsp:forward page="/pages/index.html"/>

<%
        }
        else
            out.println("Invalid login credentials");
    }
    catch(Exception e){
        out.println("Something went wrong !! Please try again");
    }
%>

<%@ page import = "java.sql.*, javax.servlet.http.*,java.util.*"%>
<html>
<head>
</head>
<body>
<div style="text-align: center">
    <h2>Search Form</h2>
    <form  >
        <strong>Name: </strong>
        <input type="search" name='search'/>
        <button type="submit">Search</button>
    </form>
</div>


<% Connection con=null;
    String search = request.getParameter("search");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con= DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "password");

        String queryString ="select * from user where name like ?";
        PreparedStatement statement = con.prepareStatement(queryString);


        statement.setString(1, "%" + search +"%" );
        ResultSet rs=statement.executeQuery();


        if(rs.next()){  %>

<table style="border: 1px;">
    <thead>

    <th>Id</th>
    <th>First Name</th><th>Last Name</th><th>User name</th><th>Password</th>
    </thead>
    <% do{  %>
    <tr>
        <td><%= rs.getInt(1) %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(4) %></td>
        <td><%= rs.getString(7) %></td>
        <td><%= rs.getString(8) %></td>



    </tr>
    <% }while(rs.next()); %>

</table>

<%}else{%>
<p style='text-align: center; color: red'>No Result Found</p>



<%

        }

    }
    catch(SQLException se){
        se.printStackTrace();
    }catch(Exception e){
        e.printStackTrace();
    }

%>

</body>
</html>
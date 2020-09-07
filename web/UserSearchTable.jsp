
<%@page import="java.sql.*"%>
<%
            String key = request.getParameter("text1");
            String search_key  = request.getParameter("text2");

        if( key != null && search_key != null  )
        {
            %>
    <table id="live_event_details" cellpadding="5px" cellspacing="5px" >
            <tr id="table_head">
                <td>User Id</td>
                <td>User Name</td>
                <td>Contact_no</td>
                <td>Email</td>
                <td>Enrollment</td>
                <td>College</td>
            </tr>
            
            
            <%
            
        
        String query = "select * from users where "+key +" LIKE  '%"+search_key+"%'";
//        out.println(query);   
            
//                               
                // out.println("<h1>"+query+"</h1>");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores", "root", "root");
                    Statement st = con.createStatement();

                    ResultSet rs = st.executeQuery(query);
                    if(rs.next()) 
                    {  
                    do{
        %>

    
            <tr >
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
            </tr>

            <%
               } while(rs.next());
                        } else {
//out.println("<h1>Not found</h1>");
//                            response.sendRedirect("SearchUser.jsp?message=Record not found, try again");
                        }

                        con.close();
                    } catch (Exception e) {
                        out.println(e);
                    }

               
}

            %>

        </table>           

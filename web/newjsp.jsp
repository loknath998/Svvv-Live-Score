<%-- 
    Document   : newjsp
    Created on : 25 May, 2020, 8:35:31 PM
    Author     : super
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
String s1=request.getParameter("choice");
String s2=request.getParameter("eventid");
String s3=request.getParameter("want_keys");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h1><%=s1%></h1>
        <h1><%=s2%></h1>
        <hr><%=s3%> <hr>
        <%
        
int in_score[]=new int[4];

    String want_keys=request.getParameter("want_keys");
    int rounds = Integer.parseInt(request.getParameter("rounds"));
    if("on".equals(want_keys))
    {
        for(int i=0;i<4;i++)
        {
            String xm= request.getParameter("tf"+(i+1));
            if(xm!=null)
                in_score[i]=Integer.parseInt(xm);
            else
                in_score[i]=0;
            
            
            out.println(in_score[i]+"<hr>");
        }
        
        int  n= (Integer)session.getAttribute("no_of_participants");
        out.println(rounds+"<hr>");
        out.println(n+"<hr>");
       
        int ck=1;
        for(int i=0;i<rounds*n*4; i++)
        {
            if(i%(n*4)==0 && i!=0)
                ck++;
            
           int y1=(int)Math.round(Math.random()*25 +1);
           int y2=(int)Math.round(Math.random()*25 +1);
           int y3=(int)Math.round(Math.random()*25 +1);
           int y4=(int)Math.round(Math.random()*25 +1);
           char x1=(char)(y1+64);
           char x2=(char)(y2+64);
           char x3=(char)(y3+64);
           char x4=(char)(y4+64);
//           if(x=='A' || x=='Z')
            int num=(int)Math.round(Math.random()*10000 +1);
           String code=""+x1+x2+x3+x4+num;
           if(ck==1)
            out.println("__round 1__"+code+"-----"+i+" // ");
           else if(ck==2)
            out.println("__round 2__"+code+"-----"+i+" || ");
           else if(ck==3)
            out.println("__round 3__"+code+"-----"+i+" -- ");
           else if(ck==4)
            out.println("__round 4__"+code+"-----"+i+" ++ ");
               
        }
        
    }

        
        
        
        %>
        
        
    </body>
</html>

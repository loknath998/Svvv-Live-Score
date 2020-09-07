/* global form3s */

function demo1()
{
    //document.getElementById('c1').innerHTML="";
    //document.getElementById('c2').innerHTML="";
    
     if(udemo() && pdemo())
   {
     // alert("correct details");
     
       form1.submit();
   }
 
   
}
    
function udemo()
{
    document.getElementById('c1').innerHTML="";
         a=document.getElementById('p1').value;
    if(a.length<3)
    {
        document.getElementById('c1').innerHTML="Username TOO short";
        return false;
    }
    else
        return true;
}
function pdemo()
{
    document.getElementById('c2').innerHTML="";
    b=document.getElementById('p2').value;
    if(b.length<4)
    {   
        document.getElementById('c2').innerHTML="Password Too short";
        return false;
    }
    else
        return true;
}
function toggleUpdate()
{
    var x = document.getElementById('nm1');

    x.readOnly=false;
    x.style.background='white';
    y1 = document.getElementById('cont1');
            y1.removeAttribute('readonly');
            y1.style.background='white';
    
    y2 =document.getElementById('email1');
            y2.removeAttribute('readonly');
            y2.style.background='white';
    
    y3 = document.getElementById('roll1');
            y3.removeAttribute('readonly');
            y3.style.background='white';
    
    y4 = document.getElementById('clg1');
            y4.removeAttribute('readonly');
            y4.style.background='white';
    
    return true;
    
}
function UpdatePass(pass)
{
    if(passwordCheck(pass) && passwordCheck2()) 
    {
        form2.submit();
    }
//    else
    {
//        document.getElementById('pwdCheck').innerHTML="First Enter correct Old Password";
    }
}

function passwordCheck2()
{
    a = document.getElementById('newpass').value;
    if(a.length <4)
    {
        document.getElementById('pwdCheck').innerHTML="Invalid new password";
        return false;
    }
    else
    {
        document.getElementById('pwdCheck').innerHTML="";
                return true;
    }
}
function passwordCheck(pass)
{
//    alert(pass);
    a = document.getElementById('oldpass').value;
    b = document.getElementById('newpass').value;
//    c = document.getElementById('').value;
    if(a !== pass )
    {
        document.getElementById('pwdCheck').innerHTML="Old password is incorrect";
        return false;
    }
    else{
        document.getElementById('pwdCheck').innerHTML="";
        return true;
    }
    
}
 function myFunction()
    {
        var x= document.getElementById("editPassword");
        if(x.style.display === "none")
        {
            x.style.display = "block";
//            x.style.display="block";
        }
        else{
            x.style.display="none";
        }
        
    }
    
 
function search()
{
 
    var text1=$("#keys").val();
    var text2=$("#search_key").val().trim();
//    if(text2==="")
    {
//        location.reload();
        //when we remove all the text from searchbox, which we have typed in it by keep on pressing backspace or delete or any other means,then again the studentlogin.jsp or expertlogin.jsp is loaded.

    }
//    else
    {
        var data={text1:text1, text2:text2};
        $.post("UserSearchTable.jsp",data,processResponse);
    }
        
}
function processResponse(responseText)
{
//        alert(responseText);

    responseText=responseText.trim();
//    if(responseText==="emptytext")//If we type only spaces in the searchbox
//        return;
//    else
    {
        $("#userSearchTable").empty();
        //alert(responseText);
        $("#userSearchTable").html(responseText);
        $(window).scrollTop(0);
        //so that the page moves to top each time search result is displayed
    }
}
            


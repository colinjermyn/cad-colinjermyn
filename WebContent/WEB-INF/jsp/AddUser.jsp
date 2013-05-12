<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Users using ajax</title>
<script src="/cad-colinjermyn-springmvc/js/jquery.js"></script>
<script type="text/javascript">
function doAjaxPost() {  
	  // get the form values  
	  var name = $('#name').val();
	  var education = $('#education').val();
	   
	  $.ajax({  
	    type: "POST",  
	    url: "/cad-colinjermyn-springmvc/AddUser.htm",  
	    data: "name=" + name + "&education=" + education,  
	    success: function(response){
	      // we have the response 
	      if(response.status == "SUCCESS"){
	    	  $('#info').html("User has been added to the list successfully");
	    	  $('#name').val('');
		      $('#education').val('');
	      }else{
	    	  $('#info').html("Sorry, there is some thing wrong with the data provided.");
	      }	      
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
	}  
</script>
</head>
<body>
<h1>CAD - Colin Jermyn - R00057532</h1>
<h6>This application was built using Spring and Maven</h6>
<br></br>
	<table>
		<tr><td>Enter your name : </td><td> <input type="text" id="name"><br/></td></tr>
		<tr><td>Education : </td><td> <input type="text" id="education"><br/></td></tr>
		<tr><td colspan="2"><input type="button" value="Add Users" onclick="doAjaxPost()"><br/></td></tr>
		<tr><td colspan="2"><div id="info" style="color: green;"></div></td></tr>
	</table>
	<a href="/cad-colinjermyn-springmvc/ShowUsers.htm">Show All Users</a>
	<a href="<c:url value="j_spring_security_logout" />" > Logout</a>
</body>
</html>
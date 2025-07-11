<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page errorPage="paginaErro.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Clientes</title>
<style>
       a {
      display: block;
      margin: 10px 0;
      text-decoration: none;
      color: #333;
      font-family: Arial, sans-serif;
      text-align: center;
    }

    	a:hover {
      color: #007BFF;
    }
</style>
</head>
<body>
	<div>
	<jsp:include page="listarClientes.jsp"></jsp:include>
	</div>
	<a href="cadCliente.html">Cadastrar Cliente</a><br>
</body>
</html>
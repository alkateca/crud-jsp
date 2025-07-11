<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="projeto_JSP.Cliente"%>
<%@page import="java.util.*"%>
<%@page errorPage="paginaErro.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="clienteBean" class="projeto_JSP.Cliente" scope="request"/>
 <jsp:setProperty name="clienteBean" property="idPessoa" param="idPessoa" />
<%
 if(clienteBean.remover()){
%>
<jsp:forward page="adicionarCliente.jsp"/>
<%
 } else {
 out.println("<br/>Erro ao excluir pessoa!");
 out.println("<br/><a href=cadCliente.html> Voltar para a lista </a>");
 }
%>
</body>
</html>
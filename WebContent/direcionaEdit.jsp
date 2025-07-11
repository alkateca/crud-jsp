<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="projeto_JSP.Cliente"%>
    <%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
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
 

 String nome = request.getParameter("nome");
 String email = request.getParameter("email");
 String endereco = request.getParameter("endereco");
 String dataCadastroStr = request.getParameter("dataCadastro");
 String limiteCreditoStr = request.getParameter("limiteCredito");

 clienteBean.setNome(nome);
 clienteBean.setEmail(email);
 clienteBean.setEndereco(endereco);
 
 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 Date dataCadastro = sdf.parse(dataCadastroStr);
 clienteBean.setDataCadastro(dataCadastro);
 
 double limiteCredito = Double.parseDouble(limiteCreditoStr);
 clienteBean.setLimiteCredito(limiteCredito);
 
 %>     
        <%
            if (clienteBean.atualizar()) {
         %>
            <jsp:forward page="adicionarCliente.jsp"/>
        <%}else {%>
             <jsp:forward page="paginaErro.jsp"/>
        <%}%>
</body>
</html>
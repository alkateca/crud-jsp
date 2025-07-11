<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="projeto_JSP.Cliente"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page errorPage="paginaErro.jsp"%>
<body>
<jsp:useBean id="clienteBean" class="projeto_JSP.Cliente" scope="request"/>
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
 
 if (clienteBean.salvar()) {
 %>
 <jsp:forward page="adicionarCliente.jsp"/>
 <%
 } else {%>
 <jsp:forward page="cadErro.jsp"/>
 <%}%>
 </body>
</html>
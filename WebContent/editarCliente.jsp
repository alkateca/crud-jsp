<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="projeto_JSP.Cliente"%>
<%@page import="java.util.*"%>
<%@page errorPage="paginaErro.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Editar Pessoa</title>
  <style>
    .form-container {
      width: 300px;
      margin: 60px auto;
      text-align: justify;
      border: 1px solid #ccc;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      font-family: Arial, sans-serif;
    }

    .form-container input[type="text"],
    .form-container input[type="number"],
    .form-container input[type="date"] {
      width: 100%;
      margin-bottom: 10px;
      padding: 4px;
    }

    .form-container input[type="submit"],
    .form-container input[type="reset"] {
      margin-top: 10px;
    }

    .cancel-link {
      display: block;
      width: 300px;
      margin: 20px auto 0;
      text-align: center;
      font-family: Arial, sans-serif;
    }

    .cancel-link a {
      text-decoration: none;
      color: #007BFF;
    }

    .cancel-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <jsp:useBean id="clienteBean" class="projeto_JSP.Cliente" scope="request"/>
  <jsp:setProperty name="clienteBean" property="idPessoa" param="idPessoa" />
  <%
    Cliente cliente = clienteBean.buscarID();
    String dataFormatada = "";
    if (cliente.getDataCadastro() != null) {
      java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
      dataFormatada = sdf.format(cliente.getDataCadastro());
    }
  %>

  <div class="form-container">
    <h2>Editar Pessoa</h2>
    <form method="POST" action="direcionaEdit.jsp">
      <input type="hidden" name="idPessoa" value="<%=cliente.getIdPessoa()%>"/>
      Nome: <input type="text" name="nome" value="<%=cliente.getNome()%>"><br>
      Endereço: <input type="text" name="endereco" value="<%=cliente.getEndereco()%>"><br>
      Crédito: <input type="number" step="0.01" name="limiteCredito" value="<%=cliente.getLimiteCredito()%>"><br>
      Data: <input type="date" name="dataCadastro" value="<%=dataFormatada%>"><br>
      <input type="submit" value="OK">
      <input type="reset" value="Limpar">
    </form>
  </div>

  <div class="cancel-link">
    <a href="cadCliente.html">Cancelar</a>
  </div>
</body>
</html>

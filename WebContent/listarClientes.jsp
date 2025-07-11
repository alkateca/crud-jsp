<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="projeto_JSP.Cliente"%>
<%@page import="java.util.*"%>
<%@page errorPage="paginaErro.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Listar Clientes</title>
  <style>
    .table-container {
      width: 80%;
      margin: 60px auto;
      font-family: Arial, sans-serif;
      text-align: center;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    th, td {
      border: 1px solid #ccc;
      padding: 10px;
    }

    th {
      background-color: #f2f2f2;
    }

    a {
      text-decoration: none;
      color: #007BFF;
    }

    a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="table-container">
    <h2>Lista de Clientes</h2>
    <jsp:useBean id="clienteBean" class="projeto_JSP.Cliente" scope="request"/>
    <%
      List<Cliente> lista = clienteBean.listar();
      request.setAttribute("lista", lista);
    %>
    <table>
      <tr>
        <th>Nome</th>
        <th>Endereço</th>
        <th>Excluir</th>
        <th>Editar</th>
      </tr>
      <c:forEach var="cliente" items="${lista}">
        <tr>
          <td>${cliente.getNome()}</td>
          <td>${cliente.getEndereco()}</td>
          <td><a href="excluirCliente.jsp?idPessoa=${cliente.getIdPessoa()}">Excluir</a></td>
          <td><a href="editarCliente.jsp?idPessoa=${cliente.getIdPessoa()}">Editar</a></td>
        </tr>
      </c:forEach>
    </table>
  </div>
</body>
</html>

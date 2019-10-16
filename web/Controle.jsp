<%--
  Created by IntelliJ IDEA.
  User: Matheus Mazoni
  Date: 10/16/19
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="ConexaoBD.Conexao,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br">
<head>
    <title> Controle de fluxo </title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
</head>
<body>
<%
    String sql = null;
    int varId = 0;
    String varTela = request.getParameter("tela");
    if (varTela.equals("incluir") || varTela.equals("alterar") || varTela.equals("excluir") || varTela.equals("consultar") || varTela.equals("telaalterar")) {
        varId = Integer.parseInt(request.getParameter("id"));
    }
    if (varTela.equals("incluir")) {
        String varNome = request.getParameter("nome");
        double varRenda = Double.parseDouble(request.getParameter("renda"));
        sql = "insert into cliente values(" + varId + ",'" + varNome + "'," + varRenda + ")";
    }
    if (varTela.equals("telaalterar")) {
        String varNome = request.getParameter("nome");
        double varRenda = Double.parseDouble(request.getParameter("renda"));
        sql = "update cliente set nome='" + varNome + "', renda=" + varRenda + " where id=" + varId + "";
    }
    if (varTela.equals("excluir")) {
        sql = "delete from cliente where id=" + varId + "";
    }
    Conexao conbd = new Conexao();
    conbd.conectar();
    if (conbd.getRetorno() == 0) {
        System.out.println("Erro na conexão com o banco de dados");
    } else {
        if (varTela.equals("incluir") || varTela.equals("excluir")|| varTela.equals("telaalterar")) {
            conbd.incAltExc(sql);
            if (conbd.getRetorno() == 0) {
                System.out.println("<h2 align='center'>Erro na operação</h2>");
                System.out.println("<br /> <br />");
                System.out.println("<p align='center'><a href='index.jsp'>Home</a></p>");
            } else {
                System.out.println("<h2 align='center'>Operação realizada com sucesso</h2>");
                System.out.println("<br /> <br />");
                System.out.println("<p align='center'><a href='index.jsp'>Home</a></p>");
            }
        }
        if (varTela.equals("alterar")) {
            response.sendRedirect("Alterar.jsp?id="+ varId +"");
        }
        if (varTela.equals("consultar")){
            response.sendRedirect("Exibir.jsp?id="+ varId +"");
        }
        if (varTela.equals("listar")){
            response.sendRedirect("Exibir.jsp?id=0");
        }
        conbd.desconectar();
    }
%>
</body>
</html>

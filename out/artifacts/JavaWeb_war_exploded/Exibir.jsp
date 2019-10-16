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
    String sql=null;
    int varId = Integer.parseInt(request.getParameter("id"));
    if (varId==0) {
        sql = "select * from cliente order by nome";
    } else {
        sql = "select * from cliente where id=" + varId + "";
    }
    Conexao conbd = new Conexao();
    conbd.conectar();
    if (conbd.getRetorno() == 0) {
        out.println("Erro na conexão com o banco de dados");
    } else {
        ResultSet rs = conbd.consultar(sql);
        if (conbd.getRetorno() == 0) {
            out.println("<h2 align='center'>Erro na pesquisa</h2>");
            out.println("<br /> <br />");
            out.println("<p align='center'><a href='index.jsp'>Home</a></p>");
        } else {
            if (!rs.next()) {
                out.println("<h2 align='center'>Nenhum registro encontrado</h2>");
                out.println("<br /> <br />");
                out.println("<p align='center'><a href='index.jsp'>Home</a></p>");
            } else {
                out.print("<table border='1' cellpadding='7' align='center'>");
                out.print("<tr><td> ID </td><td> Nome </td> <td> Renda </td> <td> Excluir </td> <td> Alterar </td> </tr>");
                do {
                    out.print("<tr>");
                    out.print("<td>");
                    out.print(rs.getString(1));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs.getString(2));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(rs.getString(3));
                    out.print("</td>");
                    out.print("<td>");
                    out.print("<a href='Controle.jsp?tela=excluir&id="+rs.getString(1)+"'> Excluir </a>");
                    out.print("</td>");
                    out.print("<td>");
                    out.print("<a href='Controle.jsp?tela=alterar&id="+rs.getString(1)+"'> Alterar </a>");
                    out.print("</td>");
                    out.print("</tr>");
                } while (rs.next());
                out.print("</table>");
                out.println("<br /> <br />");
                out.println("<p align='center'><a href='index.jsp'>Home</a></p>");
            }
        }
        conbd.desconectar();
    }
%>
</body>
</html>

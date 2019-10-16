<%--
  Created by IntelliJ IDEA.
  User: Matheus Mazoni
  Date: 10/16/19
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="ConexaoBD.Conexao,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br">
<head>
    <title> Menu Principal </title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <script type="text/JavaScript">
        function valida()
        {
            with (document.formulario)
            {
                if (nome.value == "")
                {
                    alert("Por favor, digite o nome ");
                    nome.focus();
                    return false;
                }
                if (renda.value == "")
                {
                    alert("Por favor, digite a renda");
                    renda.focus();
                    return false;
                }
            }
        }
    </script>
</head>
<body>
<%
    int maiorId = 1;
    String sql = "select max(id) from cliente";
    Conexao conbd = new Conexao();
    conbd.conectar();
    if (conbd.getRetorno() == 0) {
        out.println("Erro na conexão com o banco de dados");
        return;
    } else {
        ResultSet rs = conbd.consultar(sql);
        if (conbd.getRetorno() == 0) {
            out.println("Erro na consulta");
            return;
        } else {
            if (rs.next()) {
                maiorId = rs.getInt(1) + 1;
            }
        }
        conbd.desconectar();
    }
%>
<form name="formulario" method="post" onsubmit="javascript:return valida();" action="Controle.jsp">
    <table border="1">
        <tr>
            <td colspan="2">
                <h2>Área de cadastro</h2>
            </td>
        </tr>

        <tr>
            <td><label>ID:</label></td>
            <td><input name="id" type="text" size="10" value="<%=maiorId%>" readonly="readonly"/> </td>
        </tr>
        <tr>
            <td><label>Nome:</label></td>
            <td><input name="nome" type="text" size="45" /> </td>
        </tr>
        <tr>
            <td><label>Renda:</label></td>
            <td><input name="renda" type="text" size="15" /> </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="hidden" name="tela" value="incluir" />
                <input type="submit" value="Salvar" />
                <input type="reset" value="Limpar" />
                <input type="button" value="Voltar" onclick="history.go(-1)" />
            </td>
        </tr>
    </table>
</form>
</body>
</html>


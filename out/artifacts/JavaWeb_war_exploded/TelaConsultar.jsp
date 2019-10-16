<%--
  Created by IntelliJ IDEA.
  User: Matheus Mazoni
  Date: 10/16/19
  Time: 2:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
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
                if (id.value == "")
                {
                    alert("Por favor, digite o ID a consultar ");
                    nome.focus();
                    return false;
                }
            }
        }

        function Excluir() {
            document.formulario.tela.value = "excluir";
            var v = valida();
            if(v!=false){
                document.formulario.submit();
            }
        }

        function Consultar() {
            document.formulario.tela.value = "consultar";
            var v = valida();
            if(v!=false){
                document.formulario.submit();
            }
        }

        function Alterar() {
            document.formulario.tela.value = "alterar";
            var v = valida();
            if(v!=false){
                document.formulario.submit();
            }
        }
    </script>
</head>
<body>
<form name="formulario" method="post" action="Controle.jsp">
    <table border="1">
        <tr>
            <td colspan="2">
                <h2>Controle de Clientes</h2>
            </td>
        </tr>

        <tr>
            <td><label>ID:</label></td>
            <td><input name="id" type="text" size="10" /> </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="hidden" name="tela" value="" />
                <input type="button" value="Consultar" onclick="Consultar()" />
                <input type="button" value="Excluir" onclick="Excluir()" />
                <input type="button" value="Alterar" onclick="Alterar()" />
                <input type="reset" value="Limpar" />
                <input type="button" value="Voltar" onclick="history.go(-1)" />
            </td>
        </tr>
    </table>
</form>
</body>
</html>

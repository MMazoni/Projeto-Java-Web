/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConexaoBD;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

/**
 *
 * @author Mauricio
 */
public class Conexao {

    private Connection con;
    private Statement st;
    private int retorno;

    public Conexao() {
    }

    public int getRetorno() {
        return retorno;
    }


    public void conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd007", "mauricio", "brunoa");
            st = con.createStatement();
            retorno = 1;
        } catch (ClassNotFoundException ex) {
            retorno = 0;
        } catch (Exception ex1) {
            retorno = 0;
        }
    }

    public void incAltExc(String sql) {

        try {
            st.executeUpdate(sql);
            retorno = 1;
        }
        catch (SQLException e) {
            if (e.getErrorCode() == 1582) {
                retorno = 2;
            } else{ retorno = 0; }
        }
    }
    public ResultSet consultar(String sql) {
        ResultSet rs = null;
        try {
            rs = st.executeQuery(sql);
            retorno = 1;
        } catch (SQLException ex) {
            retorno = 0;
        }
        return rs;
    }


    public void desconectar() {
        if (con != null) {
            try {
                con.close();
                retorno= 1;
            } catch (SQLException ex) {
                retorno= 0;
            }
        }
    }
}



package br.com.consulta;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpServlet;


public class ConsultaDAO extends HttpServlet{
    private Connection con;
    
    public ConsultaDAO(Connection con){
        this.con = con;
    }
    
    public void adicionar(Consulta C) throws SQLException {
        String sql = "insert into tabelaConsulta(dataconsulta, turnoconsulta, "
                + "especialidade, idusuario) values (?,?,?,?)";
        
        try{
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, C.getDataconsulta());
            stmt.setString(2, C.getTurnoconsulta());
            stmt.setString(3, C.getEspecialidade());
            stmt.setInt(4, C.getIdusuario());
            
            stmt.execute();
            stmt.close();
        }
        catch (SQLException e) {
        }
        finally {
            con.close();
        }
            
    }
    
    public void atualizar(Consulta C) throws SQLException {
        String sql = "update into tabelaConsulta set dataconsulta = ?, turnoconsulta = ?, "
                + "especialidade = ?, idusuario = ?";
        
        try{
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, C.getDataconsulta());
            stmt.setString(2, C.getTurnoconsulta());
            stmt.setString(3, C.getEspecialidade());
            stmt.setInt(6, C.getIdusuario());
            
            stmt.execute();
            stmt.close();
        }
        catch (SQLException e) {
        }
        finally {
            con.close();
        }       
    }    
}

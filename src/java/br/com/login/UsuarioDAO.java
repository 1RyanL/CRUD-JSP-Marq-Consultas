
package br.com.login;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UsuarioDAO {
    private Connection con;
    
    public UsuarioDAO(Connection con){
        this.con = con;
    }
    
    public void adicionar(Usuario u) throws SQLException {
        String sql = "insert into tabelaUsuario(nome,datanasc, peso, email,senha) values (?,?,?,?,?)";
        
        try{
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, u.getNome());
            stmt.setString(2, u.getDataNasc());
            stmt.setString(3, u.getPeso());
            stmt.setString(4, u.getEmail());
            stmt.setString(5, u.getSenha());
            
            stmt.execute();
            stmt.close();
        }
        catch (SQLException e) {
        }
        finally {
            con.close();
        }
            
    }
    
    public void atualizar(Usuario u) throws SQLException {
        String sql = "update into tabelaUsuario set nome = ?, datanasc = ?, peso = ?, email = ?, senha = ? where id = ?";
        
        try{
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, u.getNome());
            stmt.setString(2, u.getDataNasc());
            stmt.setString(3, u.getPeso());
            stmt.setString(4, u.getEmail());
            stmt.setString(5, u.getSenha());
            stmt.setInt(6, u.getId());
            
            stmt.execute();
            stmt.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            con.close();
        }
            
    }
    
}

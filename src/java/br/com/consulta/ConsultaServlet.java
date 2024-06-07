
package br.com.consulta;

import br.com.conexao.CriarConexao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConsultaServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
    public ConsultaServlet(){
        super();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  {
        PrintWriter writer = response.getWriter();
        String dataconsulta = request.getParameter("data_consulta");
        String turno_consulta = request.getParameter("turno_consulta");
        String especialidades = request.getParameter("especialidades");
        int idusuario = Integer.parseInt((request.getParameter("idusuario")));
        
        
        Connection con;
        
        try{
            con = CriarConexao.getConexao();
            
            Consulta C = new Consulta();
            C.setDataconsulta(dataconsulta);
            C.setTurnoconsulta(turno_consulta);
            C.setEspecialidade(especialidades);
            C.setIdusuario(idusuario);
            
            ConsultaDAO dao = new ConsultaDAO(con);
            dao.adicionar(C);
            request.getRequestDispatcher("logado.jsp").forward(request, response);
        }
        catch (SQLException e) {
            System.out.println("Algo de errado.");
        }
        
    }
}

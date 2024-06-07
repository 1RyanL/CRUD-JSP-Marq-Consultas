
<%@page import="br.com.conexao.CriarConexao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&family=Public+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="w3.css"> 
        <style>
            .principal {
                font-family: "Outfit", monospace;
            }
            body{
                font-family: "Public Sans", sans-serif;
            }
        </style>
        <title>Atualizado</title>
    </head>
    <body>
        <%
        
        String email = (String) session.getAttribute("email");
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String datanasc = request.getParameter("datanasc");
        String peso = request.getParameter("peso");
        String email3 = request.getParameter("email");
        String senha = request.getParameter("senha");
        
        // Primeiro "IF" para atualização de conta pessoal
        if(request.getParameter("ac").equals("atualizar")){
            
            String url = "jdbc:mysql://localhost:3306/hospital";
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(url, "root", "");
            
            String sql = "update tabelaUsuario set nome = ?, datanasc = ?, peso = ?, email = ?, senha = ? where id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, nome);
            stmt.setString(2, datanasc);
            stmt.setString(3, peso);
            stmt.setString(4, email);
            stmt.setString(5, senha);
            stmt.setInt(6, id);
            
            stmt.executeUpdate();
            stmt.close();
            conn.close();
            
             out.println("<div class='w3-container'>");
             out.println("<h1 class='principal'> A conta de " + nome + " foi atualizada com sucesso! </h1>");
             out.println("Será redirecionado para a página inicial.");
             out.println("</div>");
        }
        
        // Segundo "IF" para atualização de conta através do administrador
        else if(request.getParameter("ac").equals("atualizar2")){
            
            String url = "jdbc:mysql://localhost:3306/hospital";
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(url, "root", "");
            
            String sql = "update tabelaUsuario set nome = ?, datanasc = ?, peso = ?, email = ? where id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, nome);
            stmt.setString(2, datanasc);
            stmt.setString(3, peso);
            stmt.setString(4, email);
            stmt.setInt(5, id);
            
            stmt.executeUpdate();
            stmt.close();
            conn.close();
           
            out.println("<div class='w3-container'>");
            out.println("<h1 class='principal'> A conta de " + nome + " foi atualizada com sucesso! </h1>");
            out.println("Será redirecionado para a página inicial.");
            out.println("</div>");
        }
        // IF para remover
        else if(request.getParameter("ac").equals("rm")){
        
                    Connection conn3 = CriarConexao.getConexao();
                    String sql3 = "delete from tabelaUsuario where id = ?";
                    PreparedStatement stmt3 = conn3.prepareStatement(sql3);
                    
                    stmt3.setInt(1, id);
                    stmt3.execute();
                    stmt3.close();
                    conn3.close();
                    
                    out.println("<div class='w3-container'>");
                    out.println("<h1 class='principal'> A Conta de " + nome + " foi excluída com sucesso! </h1>");
                    out.println("Será redirecionado para a página inicial.");
                    out.println("</div>");
                }
        %>
        <script>
            const email = "<%=email %>";
            const superemail = "a@gmail.com";
            let resultado = email.localeCompare(superemail);

            var timer = 2;
            function countdown() {
                if (timer > 0) {
                    timer -= 1;
                    setTimeout("countdown()", 1500);
                } else if (resultado !== 0) {
                    location.href = 'logado.jsp';
                } else {
                    location.href = 'novo.jsp';
                }
            }
            countdown();
        </script>
    </body>
</html>

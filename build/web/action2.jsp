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
        <title>Processo</title>
    </head>
    <body>
        <%
                 
        String email = (String) session.getAttribute("email");
        
        int n = Integer.parseInt(request.getParameter("id"));

        Connection conn3 = CriarConexao.getConexao();
        String sql = "delete from tabelaConsulta where idconsulta = " 
        + n;

        PreparedStatement stmt3 = conn3.prepareStatement(sql);

        stmt3.execute();
        stmt3.close();
        conn3.close();
        
        out.println("<div class='w3-container'>");
        out.println("<h1> A consulta foi desmarcada com sucesso! </h1>");
        out.println("Será redirecionado para a página inicial.");
        out.println("</div>");
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

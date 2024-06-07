
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
        <title>Cadastrado</title>
    </head>
    <body>
        <div class="w3-container">
        <%      
            String email = (String) request.getAttribute("email"); 
            out.println("<h4 class='principal'> Email " + email + " cadastrado com sucesso! </h4>");
            out.println("Será redirecionado à página de Login.");
        %>
        </div>
        <script>
            var timer = 2;
            function countdown() {
                if (timer > 0) {
                    timer -= 1;
                    setTimeout("countdown()", 3000);
                } else {
                    location.href = 'login.jsp';
                }
            }
            countdown();
        </script>
    </body>
</html>

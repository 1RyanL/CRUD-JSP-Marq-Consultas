<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale= 1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&family=Public+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="w3.css"> 
        <style>
            .principal {
                font-family: "Outfit", monospace;
            }
            body {
                font-family: "Public Sans", sans-serif;
            }
        </style>
        <title>Login</title>
    </head>
    <body>
        <div class="w3-container w3-khaki w3-center 
             w3-text-drak-gray w3-bottombar w3-border-dark-gray"
             <header> 
                <h2 class="principal w3-text-dark-gray">
                    Hospital Sancte Benedicte 
                </h2>
            </header>
        </div>
        <div class="w3-third w3-container">
        </div>

        <div class="w3-third w3-container">
            <div class="w3-container">
                <div class="w3-center w3-text-gray">
                    <br><br><br><br>
                    <h2 class="principal">Login</h2>
                </div>
                <form name="formLogin" id="formLogin" method="post" action="Login">
                    <p>
                        <input class="w3-input w3-border" id="email_login" name="email" 
                               required="required" type="email" 
                               placeholder="E-mail" maxlength="60">
                    </p>
                    <p>
                        <input class="w3-input w3-border" id="senha_login" name="senha" 
                               required="required" 
                               type="password" placeholder="Senha" maxlength="8">
                    </p>
                    <p>
                        <a href="index.jsp" class="w3-btn w3-dark-gray"> Cadastrar-se </a>
                        <input class="w3-btn w3-green w3-right" type="submit" value="Entrar">
                    </p>
                </form>
            </div>
        </div>
    </body>
</html>

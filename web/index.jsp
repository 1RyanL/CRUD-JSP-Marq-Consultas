<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale= 1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
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
        <title>Cadastro</title>
    </head>

    <body>
        <div class="w3-container w3-khaki w3-center 
             w3-text-drak-gray w3-bottombar w3-border-dark-gray">
             <header> 
                <h2 class="principal w3-text-dark-gray">
                    Hospital Sancte Benedicte 
                </h2>
            </header>
        </div>

        <div class="w3-third w3-container"></div>

        <div class="w3-third w3-container">

            <div class="w3-container w3-center w3-text-gray">
                <h2 class="principal">Cadastrar-se</h2>
            </div>

            <form class="w3-container" name="formCadastro" 
                  action="CadastroLogin" method="post">
                <p>
                    <label for="nome_cad"> Nome </label>    
                    <input class="w3-input" type="text" 
                           id="nome_cad" name="nome_cad" 
                           required maxlength="100">
                </p>

                <p>
                    <label for="datanasc_cad"> Data de Nascimento </label>
                    <input class="w3-input" type="date" 
                           id="datanasc_cad" name="datanasc_cad" required>
                </p>

                <p>
                    <label for="peso_cad"> Peso </label>
                    <input class="w3-input" type="text" 
                           id="peso_cad" name="peso_cad" 
                           required maxlength="4">
                </p>

                <p>
                    <label for="email_cad"> E-mail </label>
                    <input class="w3-input" type="email" 
                           id="email_cad" name="email_cad" 
                           required maxlength="100">
                </p>

                <p>
                    <label for="senha_cad"> Senha </label>
                    <input class="w3-input" type="password" 
                           id="senha_cad" name="senha_cad"
                           maxlength="8" required>
                </p>
                <p>
                    <a href="login.jsp" class="w3-btn w3-dark-gray w3-text-white"> 
                        Ir para Login 
                    </a>
                    <input class="w3-btn w3-green w3-right" type="submit" 
                           value="Cadastrar" >
                </p>
            </form> 
        </div>
    </body>
</html>

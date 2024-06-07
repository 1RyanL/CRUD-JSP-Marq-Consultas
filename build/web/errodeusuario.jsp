
<%@page isErrorPage = "true" %>
<%@page import = "java.util.Enumeration" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
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
        <title> Erro </title>
    </head>
    <body class="w3-dark-gray w3-text-white">
        <div class="w3-container">
            <h1 class="principal"> E-mail ou Senha incorretos </h1>
            <h4>
                <a href="login.jsp"> Tentar Novamente </a> 
                ou <a href="index.jsp"> Cadastrar-se </a>
            </h4>
        </div>
    </body>
</html>

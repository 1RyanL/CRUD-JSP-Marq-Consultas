<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="br.com.conexao.CriarConexao"%>
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
        <title>Conta</title>
    </head>
    <body class="w3-khaki">
        <% 
            
            String email = (String) session.getAttribute("email");
            String idusuario = (String) session.getAttribute("id");
        %>
        <div class="w3-container ">
            <div class="w3-third w3-container">
                <h1 class="principal">Configurações da Conta</h1>

                <% 
                    String nome = "";
                    String datanasc = "";
                    String peso = "";
                    String email2 = "";
                    String senha = "";
                
                    Connection conn = CriarConexao.getConexao();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("select * from tabelaUsuario "
                            + "where id = " + idusuario);
                    while(rs.next()){     
                        nome = rs.getString("nome");
                        datanasc = rs.getString("datanasc");
                        peso = rs.getString("peso");
                        email2 = rs.getString("email");
                        senha = rs.getString("senha");
               
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                %>

                <form action="action.jsp" method="post">

                    <strong> Nome </strong> 
                    <input type="hidden" name="id" 
                           value="<%=idusuario %>"></input>
                    <input class="w3-input w3-leftbar w3-border-0" type="text" name="nome" 
                           value="<%=nome %>" maxlength="100" required></input> 


                    <strong> Data de Nascimento </strong> 
                    <input class="w3-input w3-leftbar w3-border-0" type="date" name="datanasc" 
                           value="<%=datanasc %>" required></input>


                    <strong> Peso </strong> 
                    <input class="w3-input w3-leftbar w3-border-0" type="text" name="peso" 
                           value="<%=peso %>" maxlength="4" required></input>


                    <strong> Email </strong> 
                    <input class="w3-input w3-leftbar w3-border-0" type="text" name="email" 
                           value="<%=email2 %>" maxlength="60" required></input> 


                    <strong> Senha </strong> 
                    <input class="w3-input w3-leftbar w3-border-0" type="text" name="senha" 
                           value="<%=senha %>" maxlength="8"></input> 
                    <input type="hidden" name="ac" value="atualizar" required></input>
                    
                    <br>
                    <a class="w3-btn w3-dark-gray w3-left" 
                       href="logado.jsp"> Página Inicial </a>
                    
                    <input class="w3-btn w3-green w3-right" 
                           type="submit" value="Atualizar"></input>
                    
                </form>
                
            </div>
        </div>
    </body>
</html>
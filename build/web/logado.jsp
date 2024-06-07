<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="br.com.conexao.CriarConexao"%>
<%@page import="br.com.controlador.LoginControllers"%>
<%@page import="br.com.consulta.Consulta"%>
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
        <title>Logado</title>
    </head>

    <body>
        <% 
            String email = (String) session.getAttribute("email");
            String idusuario = (String) session.getAttribute("id");
        %>
        <div class="w3-container w3-khaki w3-center w3-text-drak-gray">
            <header> 
                <table class="principal w3-table">
                    <tr>
                        <td> Seja bem-vindo, <%=email %>! </td>
                        <td class="w3-right"> 
                            <a href="remover.jsp">Sair</a> 
                        </td>
                        <td class="w3-right"> 
                            <a href="contaconfig.jsp?id=<%=idusuario %>"> 
                                Configurar Conta 
                        </td>
                    </tr>
                </table>
            </header>
        </div>


        <div class="w3-quarter w3-container">

            <h3 class="principal w3-center"> Formulário para Marcação de Consultas </h3>

            <form name="formConsulta" action="Consulta" method="post">    
                <input type="hidden" name="idusuario" value="<%=idusuario %>"> 

                <label for="data_consulta"> Data da Consulta </label>
                <input class="w3-input" type="date" id="data_consulta" 
                       name="data_consulta"
                       min="2024-06-07" required>

                <br>
                <p> Turno:</p>
                <input class="w3-radio" type="radio" id="manhã" 
                       name="turno_consulta" value="manha">
                <label for="manhã">Manhã</label><br>

                <input class="w3-radio" type="radio" id="tarde" 
                       name="turno_consulta" value="tarde">
                <label for="tarde">Tarde</label><br>

                <input class="w3-radio"type="radio" id="noite" 
                       name="turno_consulta" value="noite">
                <label for="noite">Noite</label>
                <br><br>
                <p>
                    <select class="w3-select w3-border w3-center" 
                            id="especialidades" name="especialidades">
                        <option value="1" selected>Especialidade</option>
                        <option value="Cardiologista">Cardiologista</option>
                        <option value="Dermatologista">Dermatologista</option>
                        <option value="Otorrinolaringologista">Otorrinolaringologista</option>
                        <option value="Oftamologista">Oftamologista</option>
                        <option value="Pediatra">Pediatra</option>
                    </select>
                </p>
                <br>
                <p class="w3-center">
                    <input class="w3-btn w3-green" type="submit" value="Marcar">  
                </p>
            </form>
        </div>

        <div class="w3-threequarter w3-container">
            <h3 class="principal w3-center"> Consultas Marcadas </h3>
            <table class="w3-table w3-striped w3-border">
                <thead>
                
                <td> <strong> Data </strong> </td>
                <td> <strong> Turno </strong> </td>
                <td> <strong> Especialidade </strong> </td>
                <td colspan="2"> <strong> Edição </strong> </td>
                </thead> 
                <% 
                    int idconsulta = 0;
                    String dataconsulta = "";
                    String turnoconsulta = "";
                    String especialidade = "";
                
                    String sql = "select tc.idconsulta, tc.dataconsulta, tc.turnoconsulta, "
                            + "tc.especialidade from tabelaConsulta tc "
                            + "where idusuario = " + idusuario;
                
                    Connection conn = CriarConexao.getConexao();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);
            
                    while(rs.next()){
                        idconsulta = rs.getInt("idconsulta");
                        dataconsulta = rs.getString("dataconsulta");
                        turnoconsulta = rs.getString("turnoconsulta");
                        especialidade = rs.getString("especialidade");
                %>
                <tr>
                    
                    <td> <%=dataconsulta %> </td>
                    <td> <%=turnoconsulta %> </td>
                    <td> <%=especialidade %> </td>
                    <td> 
                        <a href="action2.jsp?id=<%=idconsulta %>">
                            Desmarcar
                        </a>
                    </td>
                </tr>
                <%      
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                %>
            </table>    
        </div>
    </body>
</html>

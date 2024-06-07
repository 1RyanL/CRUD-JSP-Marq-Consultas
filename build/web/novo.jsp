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
        <title>Super</title>
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
                    </tr>
                </table>
            </header>
        </div>
        <div class="w3-half w3-container">         
            <h3 class="principal w3-center"> Usuários Cadastrados no Sistema </h3>
            <table class="w3-table-all w3-center w3-border">
                <tr>
                    <td> <strong> Nome </strong> </td>
                    <td> <strong> Data de Nascimento </strong> </td>
                    <td> <strong> Peso </strong> </td>
                    <td class="w3-center"> <strong> Email </strong> </td>
                    <td colspan="2" class="w3-center"> <strong> Edição </strong> </td>
                </tr>
                <% 
                    int id = 0;
                    String nome = "";
                    String datanasc = "";
                    String peso = "";
                    String emails = "";
                
                    Connection conn = CriarConexao.getConexao();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("select "
                            + "id, nome, datanasc, peso, email "
                            + "from tabelaUsuario");
                    while(rs.next()){
                        id = rs.getInt("id");
                        nome = rs.getString("nome");
                        datanasc = rs.getString("datanasc");
                        peso = rs.getString("peso");
                        emails = rs.getString("email");
                %>
                <tr>
                    <td> <%=nome %> </td>
                    <td> <%=datanasc %> </td>
                    <td> <%=peso %> </td>
                    <td> <%=emails %> </td>
                    <td> <a href="novo.jsp?id=<%=id %>&nome=<%=nome %>
                            &datanasc=<%=datanasc %>&peso=<%=peso %>
                            &email=<%=emails %>"> 
                            Editar </a> </td>
                    <td> <a href="action.jsp?id=<%=id %>&ac=rm"> 
                            Excluir </a> </td>
                </tr>
                <%      
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                %>
            </table>

            <h3 class="principal w3-center"> Todas as Consultas Marcadas </h3>

            <table class="w3-table w3-border">
                <thead>
                <td> <strong> Data </strong> </td>
                <td> <strong> Turno </strong> </td>
                <td> <strong> Especialidade </strong> </td>
                <td> <strong> Paciente </strong> </td>
                <td colspan="2"> <strong> Edição </strong> </td>
                </thead>

                <%             
                    // EXIBIÇÃO AUTOMÁTICA DA TABELA
                    int idconsulta = 0;
                    String dataconsulta = "";
                    String turnoconsulta = "";
                    String especialidade = "";
                    String paciente = "";
                
                    String sql4 = "select tc.idconsulta, tc.dataconsulta, "
                            + "tc.turnoconsulta, tc.especialidade, "
                            + "tu.nome from tabelaConsulta tc inner join tabelaUsuario tu "
                            + "on tc.idusuario = tu.id";
                
                    Connection conn4 = CriarConexao.getConexao();
                    Statement stmt4 = conn4.createStatement();
                    ResultSet rs4 = stmt4.executeQuery(sql4);
                    while(rs4.next()){
                        idconsulta = rs4.getInt("idconsulta");
                        dataconsulta = rs4.getString("dataconsulta");
                        turnoconsulta = rs4.getString("turnoconsulta");
                        especialidade = rs4.getString("especialidade");
                        paciente = rs4.getString("nome");
                
                %>

                <tr>
                    <td> <%=dataconsulta %> </td>
                    <td> <%=turnoconsulta %> </td>
                    <td> <%=especialidade %> </td>
                    <td> <%=paciente %> </td>
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
        <div class="w3-half w3-container">    

            <h3 class="principal w3-center"> Atualizar Conta</h3>

            <form action="action.jsp" method="post">
                <table class="w3-table-all w3-center">
                    <tr>
                        <td> <strong> Nome </strong> </td>
                        <td> <strong> Data de Nascimento </strong> </td>
                    </tr>
                    <tr>

                    <input  type="text" name="id" size="5" 
                            value="<%=request.getParameter("id") %>" hidden></input> 

                    <td> 
                        <input class="w3-input w3-border" type="text" name="nome"
                               maxlength="100" required
                               value="<%=request.getParameter("nome") %>"></input> 
                    </td>
                    
                    <td> 
                        <input class="w3-input w3-border" type="date" name="datanasc"
                               required
                               value="<%=request.getParameter("datanasc") %>"></input> 
                    </td>
                    <input type="hidden" name="ac" value="atualizar2" hidden></input> 
                    </tr>
                    <tr>
                        <td> <strong> Peso </strong> </td>
                        <td> <strong> Email </strong> </td>
                    </tr>
                    <tr>
                        <td> 
                            <input class="w3-input w3-border" type="text" name="peso"
                                   maxlength="4" required
                                   value="<%=request.getParameter("peso") %>"></input> </td>
                        <td> 
                            <input class="w3-input w3-border" type="text" name="email"
                                   maxlength="60" required
                                   value="<%=request.getParameter("email") %>"></input> </td>
                    </tr>
                </table>
                    <br>
                <input class="w3-btn w3-green w3-large w3-right"  type="submit" 
                       value="Atualizar"></input>
            </form>
        </div>
    </body>
</html>


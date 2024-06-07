/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.conexao;

import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author laboratorio
 */
public class Main {
    public static void main(String[] args) throws SQLException {
        Connection con = CriarConexao.getConexao();
    }
}

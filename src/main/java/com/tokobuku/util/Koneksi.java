/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tokobuku.util;
import java.sql.*;
/**
 *
 * @author MyBook Hype AMD
 */
public class Koneksi {
    public static Connection getKoneksi() {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");
            // Ganti 'admin' dengan password psql kamu
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/db_tokobuku", "postgres", "admin");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tokobuku.util;
import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author MyBook Hype AMD
 */
public class Koneksi {
    public static Connection getKoneksi() {
    Connection conn = null;
    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/tokobuku_db", "postgres", "babibabi");
    } catch (Exception e) { 
        // Tambahkan printStackTrace agar error merah muncul di console NetBeans
        e.printStackTrace(); 
        System.out.println("Error Koneksi: " + e.getMessage());
    }
    return conn;
}
}
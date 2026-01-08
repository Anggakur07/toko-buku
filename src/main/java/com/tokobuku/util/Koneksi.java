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
            // Ganti 'namadb' dengan nama database kamu, misal: 'tokobuku'
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/namadb", "postgres", "passwordkamu");
            System.out.println("Koneksi Berhasil!"); 
        } catch (Exception e) {
            System.out.println("Koneksi Gagal: " + e.getMessage());
        }
        return conn;
    }
}
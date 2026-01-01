package com.tokobuku.controller;

import com.tokobuku.model.Buku;
import com.tokobuku.util.Koneksi;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BukuServlet", urlPatterns = {"/BukuServlet"})
public class BukuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Buku> list = new ArrayList<>();
        
        try (Connection con = Koneksi.getKoneksi()) {
            if (con != null) {
                String sql = "SELECT * FROM buku";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                
                while (rs.next()) {
                   Buku b = new Buku();
                    b.setJudul(rs.getString("TERUS BODOH"));
                    b.setHarga(rs.getDouble("120.000"));
                    b.setGambar(rs.getString("terus_bodoh.jpg"));
                    b.setPenulis(rs.getString("TERE LIYE")); // Tambahkan ini
                    list.add(b);
                }
            }
            // Kirim data ke index.jsp
            request.setAttribute("daftarBuku", list);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
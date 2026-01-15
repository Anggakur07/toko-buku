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
    
    String keyword = request.getParameter("query");
    List<Buku> listBuku = new ArrayList<>();

    try (Connection conn = Koneksi.getKoneksi()) {
        if (conn == null) {
            throw new Exception("Koneksi Database Gagal!");
        }

        String sql = "SELECT * FROM buku";
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += " WHERE judul ILIKE ? OR penulis ILIKE ?";
        }

        PreparedStatement ps = conn.prepareStatement(sql);
        if (keyword != null && !keyword.trim().isEmpty()) {
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
        }

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Buku b = new Buku();
            b.setId(rs.getInt("id"));
            b.setJudul(rs.getString("judul"));
            b.setPenulis(rs.getString("penulis"));
            b.setHarga(rs.getDouble("harga"));
            // Pastikan di database nama kolomnya adalah 'gambar_url'
            b.setGambar(rs.getString("gambar_url")); 
            listBuku.add(b);
        }
        
        // Kirim data ke JSP
        request.setAttribute("daftarBuku", listBuku);

    } catch (Exception e) {
        e.printStackTrace(); // Agar error muncul di console IDE
        request.setAttribute("error", e.getMessage());
    }

    // FORWARD HANYA BOLEH SEKALI DI SINI (DI LUAR TRY)
    request.getRequestDispatcher("/index.jsp").forward(request, response);
}
}
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
        String keyword = request.getParameter("query"); // Ini nama 'name' di input HTML
List<Buku> listBuku = new ArrayList<>();

try (Connection conn = Koneksi.getKoneksi()) {
    String sql = "SELECT * FROM buku";
    
    // Jika user ngetik di kolom cari
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
        b.setHarga(rs.getInt("harga"));
        b.setGambar(rs.getString("gambar_url"));
        listBuku.add(b);
    }
    request.setAttribute("daftarBuku", listBuku);
    request.getRequestDispatcher("index.jsp").forward(request, response);
} catch (Exception e) {
    
}
        List<Buku> list = new ArrayList<>();
        
        try (Connection con = Koneksi.getKoneksi()) {
            if (con != null) {
                String sql = "SELECT * FROM buku";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                
             while (rs.next()) {
    Buku b = new Buku();
    
   
    b.setId(rs.getInt("id")); 
    b.setJudul(rs.getString("judul"));
    b.setPenulis(rs.getString("penulis"));
    b.setHarga(rs.getDouble("harga"));
    b.setGambar(rs.getString("gambar"));
    list.add(b);
}            }
           
            request.setAttribute("daftarBuku", list);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            
        } catch (Exception e) {
            
        }
    }
}
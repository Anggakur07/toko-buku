/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tokobuku.model;

/**
 *
 * @author MyBook Hype AMD
 */
public class Buku {
    private String judul, penulis, gambar;
    private double harga; // Gunakan double untuk tipe numeric

    public double getHarga() { return harga; }
    public void setHarga(double harga) { this.harga = harga; }

    public String getGambar() { return gambar; }
    public void setGambar(String gambar) { this.gambar = gambar; }

    public String getJudul() { return judul; }
    public void setJudul(String judul) { this.judul = judul; }
    public String getPenulis() { return penulis; }
    public void setPenulis(String penulis) { this.penulis = penulis; }
}

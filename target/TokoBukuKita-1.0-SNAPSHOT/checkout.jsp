<%-- 
    Document   : checkout
    Created on : 6 Jan 2026, 11.57.31
    Author     : MyBook Hype AMD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout - TokoBukuKita</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        :root {
            --warna-utama: #f1c40f; 
            --warna-biru: #0056b3;              --warna-bg: #f8f9fa;
        }
        body { background-color: var(--warna-bg); font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        
        
        .checkout-header { 
            background: white; 
            padding: 15px 0; 
            border-bottom: 3px solid var(--warna-utama); 
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .logo-text { color: var(--warna-biru); font-weight: bold; font-size: 24px; }
        .logo-sub { color: var(--warna-utama); font-weight: bold; font-size: 24px; }
        
        .card-custom { 
            background: white; 
            padding: 25px; 
            margin-top: 20px; 
            border-radius: 8px; 
            border: none;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        
        .section-title { color: var(--warna-biru); border-bottom: 2px solid #eee; padding-bottom: 10px; margin-bottom: 20px; }
        
        
        .btn-bayar { 
            background-color: var(--warna-utama); 
            color: #333; 
            font-weight: bold; 
            padding: 12px 50px; 
            border: none; 
        }
        .btn-bayar:hover { background-color: #d4ac0d; color: black; }
        
       
        .btn-back { color: var(--warna-biru); text-decoration: none; font-weight: 500; }
        .btn-back:hover { text-decoration: underline; }
    </style>
</head>
<body>

<div class="checkout-header">
    <div class="container d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center">
            <span class="logo-text">Buku</span><span class="logo-sub">Kita</span>
            <div class="ms-3 ps-3 border-start text-secondary">Halaman Checkout</div>
        </div>
        <a href="BukuServlet" class="btn-back">
            <i class="bi bi-arrow-left"></i> Kembali Belanja
        </a>
    </div>
</div>

<div class="container mb-5">
    <div class="card-custom">
        <h5 class="section-title"><i class="bi bi-geo-alt-fill"></i> Alamat Pengiriman</h5>
        <div class="row">
            <div class="col-md-3"><strong>Nama Penerima</strong></div>
            <div class="col-md-9 text-muted">Jl. Contoh Alamat No. 123, Kota Anda, Indonesia</div>
        </div>
    </div>

    <div class="card-custom">
        <h5 class="section-title"><i class="bi bi-bag-check-fill"></i> Rincian Produk</h5>
        <table class="table align-middle">
            <thead class="table-light">
                <tr>
                    <th>Produk</th>
                    <th class="text-center">Harga</th>
                    <th class="text-center">Jumlah</th>
                    <th class="text-end">Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div style="width: 50px; height: 70px; background: #eee; margin-right: 15px;"></div>
                            <span>Judul Buku Anda</span>
                        </div>
                    </td>
                    <td class="text-center">Rp 100.000</td>
                    <td class="text-center">1</td>
                    <td class="text-end">Rp 100.000</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="card-custom">
        <div class="row align-items-center">
            <div class="col-md-6">
                <p class="text-muted mb-0">Dengan mengklik tombol, Anda menyetujui syarat & ketentuan.</p>
            </div>
            <div class="col-md-6 text-end">
                <span class="me-3 fs-5">Total Pesanan:</span>
                <span class="fs-3 fw-bold" style="color: var(--warna-biru);">Rp 100.000</span>
                <div class="mt-3">
                    <button class="btn btn-bayar btn-lg shadow-sm">CHECKOUT SEKARANG</button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
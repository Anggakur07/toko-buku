<%-- 
    Document   : index
    Created on : 1 Jan 2026, 10.50.36
    Author     : MyBook Hype AMD
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.tokobuku.model.Buku" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>BukuKita - Toko Buku Online</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            @keyframes putarTerus {
                from {
                    transform: rotate(0deg);
                }
                to {
                    transform: rotate(360deg);
                }
            }

            .icon-putar {
                display: inline-block;
                animation: putarTerus 2s linear infinite; /* 2 detik per putaran, tanpa henti */
            }

            /* Tambahan agar tampilan modal lebih halus */
            #modalBerhasil .modal-content {
                border: none;
                border-radius: 20px;
            }

            .btn-warning {
                background-color: #ffc107;
                border: none;
            }
            .btn-warning:hover {
                background-color: #e0a800;
            }
            .card {
                transition: transform 0.2s;
            }
            .card:hover {
                transform: translateY(-5px);
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f8f9fa;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }


            .top-header {
                background-color: #007bff;
                color: white;
                padding: 12px 0;
                text-align: center;
            }
            .top-header h2 {
                font-weight: 700;
                letter-spacing: 1px;
                margin: 0;
                font-size: 24px;
            }

            .main-nav {
                background: white;
                border-bottom: 3px solid #ffc107;
                padding: 15px 0;
            }
            .logo {
                font-size: 28px;
                font-weight: 800;
                color: #007bff;
                text-decoration: none;
            }
            .logo span {
                color: #ffc107;
            }


            .container {
                flex: 1;
            }
            .book-card {
                background: white;
                border-radius: 12px;
                padding: 15px;
                transition: 0.3s;
                border: 1px solid #eee;
                text-align: center;
            }
            .book-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            }
            .book-img {
                width: 100%;
                height: 250px;
                object-fit: contain;
                margin-bottom: 15px;
                border-radius: 8px;
            }


            footer {
                background: #212529;
                color: #aaa;
                padding: 25px 0;
                margin-top: 50px;
            }

            .btn-cart {
                background: #ffc107;
                color: #000;
                font-weight: 600;
                border: none;
                transition: 0.2s;
            }
            .btn-cart:hover {
                background: #e0a800;
                transform: scale(1.02);
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>

        <div class="top-header shadow-sm">
            <h2>Selamat Datang di BukuKita </h2>
        </div>

        <nav class="main-nav sticky-top">
            <div class="container d-flex justify-content-between align-items-center">
                <a href="#" class="logo">Buku<span>Kita</span></a>

                <div class="search-box w-50 d-none d-md-block">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Cari Judul atau Penulis...">
                        <button class="btn btn-primary">Cari</button>
                    </div>
                </div>
                <div class="d-flex gap-4">
            <a href="about.jsp" class="text-decoration-none fw-bold text-dark">About Us</a>
            <a href="gallery.jsp" class="text-decoration-none fw-bold text-dark">Gallery</a>
        </div>

                <div class="cart-box position-relative" style="cursor: pointer;" onclick="showCartItems()">
                    <span style="font-size: 28px;">🛒</span>
                    <span id="cart-count" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">0</span>
                </div>
            </div>
        </nav>

        <div class="container mt-4">
            <h3 class="mb-4 border-start border-primary border-4 ps-2">KOLEKSI BUKU NOVEL</h3>

            <div class="row row-cols-1 row-cols-md-5 g-4">
                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="card-img-top p-2" alt="Buku 1" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">Cantik Itu Luka</h6>
                            <p class="text-muted small mb-1">Penulis: Eko Kurniawan</p>
                            <p class="text-primary fw-bold">Rp 195.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Cantik Itu Luka', 195000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/2.jpg" class="card-img-top p-2" alt="Buku 2" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">Negeri 5 menara </h6>
                            <p class="text-muted small mb-1">Penulis: Andi Prasetyo</p>
                            <p class="text-primary fw-bold">Rp 280.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Database MySQL', 80000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/3.jpg" class="card-img-top p-2" alt="Buku 3" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">teruslah bodoh</h6>
                            <p class="text-muted small mb-1">Penulis: tere liye</p>
                            <p class="text-primary fw-bold">Rp 120.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Algoritma', 120000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/4.jpg" class="card-img-top p-2" alt="Buku 4" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">laut bercerita</h6>
                            <p class="text-muted small mb-1">Penulis: leila s. chidori</p>
                            <p class="text-primary fw-bold">Rp 175.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Bootstrap 5', 75000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/5.jpg" class="card-img-top p-2" alt="Buku 5" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">hello,Gello</h6>
                            <p class="text-muted small mb-1">Penulis: Siti Aminah</p>
                            <p class="text-primary fw-bold">Rp 150.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Spring Boot', 150000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                       
                        <div class="container mt-4">
            <h3 class="mb-4 border-start border-primary border-4 ps-2">KOLEKSI BUKU ENSIKLOPEDIA</h3>

            <div class="row row-cols-1 row-cols-md-5 g-4">
                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/6.jpg" class="card-img-top p-2" alt="Buku 1" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">ensiklopedia sains </h6>
                            <p class="text-muted small mb-1">Penulis: Eko Kurniawan</p>
                            <p class="text-primary fw-bold">Rp 95.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Cantik Itu Luka', 195000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/7.jpg" class="card-img-top p-2" alt="Buku 2" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">ensiklopedia alam semesta </h6>
                            <p class="text-muted small mb-1">Penulis: Andi Prasetyo</p>
                            <p class="text-primary fw-bold">Rp 230.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Database MySQL', 80000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/8.jpg" class="card-img-top p-2" alt="Buku 3" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">ensiklopedia pendidikan</h6>
                            <p class="text-muted small mb-1">Penulis: tere liye</p>
                            <p class="text-primary fw-bold">Rp 220.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Algoritma', 120000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/9.jpg" class="card-img-top p-2" alt="Buku 4" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">ensiklopedia hari ahkir</h6>
                            <p class="text-muted small mb-1">Penulis: leila s. chidori</p>
                            <p class="text-primary fw-bold">Rp 105.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Bootstrap 5', 75000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/10.jpg" class="card-img-top p-2" alt="Buku 5" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">ensiklopedia sukabumi</h6>
                            <p class="text-muted small mb-1">Penulis: Siti Aminah</p>
                            <p class="text-primary fw-bold">Rp 70.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Spring Boot', 150000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        
                        <div class="container mt-4">
            <h3 class="mb-4 border-start border-primary border-4 ps-2">KOLEKSI BUKU SEJARAH</h3>

            <div class="row row-cols-1 row-cols-md-5 g-4">
                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/11.jpg" class="card-img-top p-2" alt="Buku 1" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">sejarah dunia lengkap</h6>
                            <p class="text-muted small mb-1">Penulis: Eko Kurniawan</p>
                            <p class="text-primary fw-bold">Rp 95.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Cantik Itu Luka', 195000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/12.jpg" class="card-img-top p-2" alt="Buku 2" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">sejarah indonesia </h6>
                            <p class="text-muted small mb-1">Penulis: Andi Prasetyo</p>
                            <p class="text-primary fw-bold">Rp 180.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Database MySQL', 80000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/13.jpg" class="card-img-top p-2" alt="Buku 3" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">sejarah dunia disembunyikan</h6>
                            <p class="text-muted small mb-1">Penulis: tere liye</p>
                            <p class="text-primary fw-bold">Rp 120.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Algoritma', 120000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/14.jpg" class="card-img-top p-2" alt="Buku 4" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">sejarah perang dunia</h6>
                            <p class="text-muted small mb-1">Penulis: leila s. chidori</p>
                            <p class="text-primary fw-bold">Rp 125.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Bootstrap 5', 75000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/15.jpg" class="card-img-top p-2" alt="Buku 5" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">intisari sejarah</h6>
                            <p class="text-muted small mb-1">Penulis: Siti Aminah</p>
                            <p class="text-primary fw-bold">Rp 150.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Spring Boot', 150000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        
                        <div class="container mt-4">
            <h3 class="mb-4 border-start border-primary border-4 ps-2">KOLEKSI BUKU SASTRA</h3>

            <div class="row row-cols-1 row-cols-md-5 g-4">
                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/16.jpg" class="card-img-top p-2" alt="Buku 1" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">sosiologi sastra</h6>
                            <p class="text-muted small mb-1">Penulis: Eko Kurniawan</p>
                            <p class="text-primary fw-bold">Rp 19.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Cantik Itu Luka', 195000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/17.jpg" class="card-img-top p-2" alt="Buku 2" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">sastra indonesia</h6>
                            <p class="text-muted small mb-1">Penulis: Andi Prasetyo</p>
                            <p class="text-primary fw-bold">Rp 20.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Database MySQL', 80000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/18.jpg" class="card-img-top p-2" alt="Buku 3" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">kritik sastra</h6>
                            <p class="text-muted small mb-1">Penulis: tere liye</p>
                            <p class="text-primary fw-bold">Rp 19.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Algoritma', 120000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/19.jpg" class="card-img-top p-2" alt="Buku 4" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">apa itu sastra</h6>
                            <p class="text-muted small mb-1">Penulis: leila s. chidori</p>
                            <p class="text-primary fw-bold">Rp 75.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Bootstrap 5', 75000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card h-100 shadow-sm border-0 text-center">
                        <div style="height: 200px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                            <img src="${pageContext.request.contextPath}/img/20.jpg" class="card-img-top p-2" alt="Buku 5" style="max-height: 100%; width: auto; object-fit: contain;">
                        </div>
                        <div class="card-body">
                            <h6 class="card-title fw-bold">kitab sastra</h6>
                            <p class="text-muted small mb-1">Penulis: Siti Aminah</p>
                            <p class="text-primary fw-bold">Rp 50.000</p>
                            <button class="btn btn-warning btn-sm w-100 fw-bold" onclick="tambahKeKeranjang('Spring Boot', 150000)">
                                Tambah Keranjang
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                       
        <footer class="text-center">
            <p class="mb-0">© 2026 Toko Buku Kita. All Rights Reserved.</p>
            <small>Dibuat oleh kelompok(lupa)</small>
        </footer>

        <script>
            function tambahKeKeranjang(namaBuku, harga) {

                let cartCount = document.querySelector('.badge');
                if (cartCount) {
                    let currentCount = parseInt(cartCount.innerText) || 0;
                    cartCount.innerText = currentCount + 1;
                }


                var myModal = new bootstrap.Modal(document.getElementById('modalBerhasil'));
                myModal.show();

                const cartList = document.getElementById('cart-list');
                const li = document.createElement('li');
                li.className = 'list-group-item d-flex justify-content-between align-items-center border-0 px-0';
                li.innerHTML = `<span>${namaBuku}</span> <span class="fw-bold">Rp ${harga.toLocaleString()}</span>`;
                cartList.appendChild(li);


                updateTotal(harga);
            }

            let currentTotal = 0;
            function updateTotal(harga) {
                currentTotal += harga;
                document.getElementById('cart-total').innerText = "Rp " + currentTotal.toLocaleString();
            }

        </script>
        <div class="modal fade" id="cartModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title">Isi Keranjang Belanja</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <ul id="cart-list" class="list-group mb-3">
                        </ul>
                        <div class="d-flex justify-content-between fw-bold">
                            <span>Total Bayar:</span>
                            <span id="cart-total">Rp 0</span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Lanjut Belanja</button>
                        <a href="checkout" class="btn btn-success">Checkout Sekarang</a>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

       <script>
    let cartItems = [];
    let totalPrice = 0;

    // Fungsi Utama Tambah Keranjang
    function tambahKeKeranjang(namaBuku, harga) {
        // 1. Simpan ke array data
        cartItems.push({ judul: namaBuku, harga: harga });
        
        // 2. Update Total Harga dan Hitungan Badge
        totalPrice += parseFloat(harga);
        document.getElementById('cart-count').innerText = cartItems.length;

        // 3. Notifikasi Berhasil (SweetAlert2)
        Swal.fire({
            icon: 'success',
            title: 'Buku Ditambahkan!',
            text: namaBuku + ' sudah masuk keranjang belanja kamu.',
            showConfirmButton: false,
            timer: 1500,
            position: 'center'
        });
    }

    // Fungsi Tampilkan Isi Keranjang di Modal
    function showCartItems() {
        let listHtml = "";
        const cartListElement = document.getElementById('cart-list');
        const cartTotalElement = document.getElementById('cart-total');

        if (cartItems.length === 0) {
            listHtml = "<li class='list-group-item text-center text-muted'>Keranjang masih kosong</li>";
        } else {
            cartItems.forEach((item) => {
                listHtml += `
                    <li class='list-group-item d-flex justify-content-between align-items-center'>
                        ${item.judul}
                        <span class='badge bg-primary rounded-pill'>Rp ${item.harga.toLocaleString('id-ID')}</span>
                    </li>`;
            });
        }

        // Masukkan ke elemen modal
        cartListElement.innerHTML = listHtml;
        cartTotalElement.innerText = "Rp " + totalPrice.toLocaleString('id-ID');

        // Munculkan Modal Keranjang
        var myModal = new bootstrap.Modal(document.getElementById('cartModal'));
        myModal.show();
    }
</script>
    </body>
    <div class="modal fade" id="modalBerhasil" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content text-center p-4 shadow">
                <div class="modal-body">
                    <div class="mb-3">
                        <div class="icon-putar">
                            <i class="bi bi-check-circle-fill text-success" style="font-size: 80px;"></i>
                        </div>
                    </div>
                    <h3 class="fw-bold text-secondary">Buku Ditambahkan!</h3>
                    <p class="text-muted">sudah masuk keranjang belanja kamu.</p>
                    <button type="button" class="btn btn-warning px-5 mt-2 fw-bold" data-bs-dismiss="modal" style="border-radius: 10px;">OK</button>
                </div>
            </div>
        </div>
    </div>
</html>
 
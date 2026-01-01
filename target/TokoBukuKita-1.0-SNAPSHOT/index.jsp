<%-- 
    Document   : index
    Created on : 1 Jan 2026, 10.50.36
    Author     : MyBook Hype AMD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>BukuKita - Toko Buku Online</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
            font-family: 'Poppins', sans-serif; 
            background-color: #f8f9fa; 
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Agar footer selalu di bawah */
        }
        
        
        .top-header { background-color: #007bff; color: white; padding: 12px 0; text-align: center; }
        .top-header h2 { font-weight: 700; letter-spacing: 1px; margin: 0; font-size: 24px; }
        
        .main-nav { background: white; border-bottom: 3px solid #ffc107; padding: 15px 0; }
        .logo { font-size: 28px; font-weight: 800; color: #007bff; text-decoration: none; }
        .logo span { color: #ffc107; }

       
        .container { flex: 1; } /* Menarik konten agar footer terdorong ke bawah */
        .book-card { 
            background: white; border-radius: 12px; padding: 15px; 
            transition: 0.3s; border: 1px solid #eee; text-align: center;
        }
        .book-card:hover { transform: translateY(-8px); box-shadow: 0 10px 20px rgba(0,0,0,0.1); }
        .book-img { width: 100%; height: 250px; object-fit: contain; margin-bottom: 15px; border-radius: 8px; }
        
        
        footer { background: #212529; color: #aaa; padding: 25px 0; margin-top: 50px; }
        
        .btn-cart { background: #ffc107; color: #000; font-weight: 600; border: none; transition: 0.2s; }
        .btn-cart:hover { background: #e0a800; transform: scale(1.02); }
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

            <div class="cart-box position-relative" style="cursor: pointer;" onclick="showCartItems()">
                <span style="font-size: 28px;">🛒</span>
                <span id="cart-count" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">0</span>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <h4 class="mb-4" style="border-left: 5px solid #007bff; padding-left: 15px; font-weight: 700;">KOLEKSI TERBARU</h4>
        <div class="row g-4">
    <c:forEach var="b" items="${daftarBuku}">
        <div class="col-md-4">
            <div class="book-card">
                <img src="img/${b.gambar}" class="book-img" alt="${b.judul}">
                
                <div class="book-title">${b.judul}</div>
                <div class="book-author">Penulis: ${b.penulis}</div>
                <div class="book-price">Rp ${String.format("%,.0f", b.harga)}</div>
                
                <button class="btn btn-cart w-100" onclick="addToCart('${b.judul}', ${b.harga})">
                    Tambah Keranjang
                </button>
            </div>
        </div>
    </c:forEach>    
</div>
    </div>

    <footer class="text-center">
        <p class="mb-0">© 2026 Toko Buku Kita. All Rights Reserved.</p>
        <small>Dibuat oleh kelompok(lupa)</small>
    </footer>

    <script>
        let count = 0;
        function addToCart(title) {
            count++;
            document.getElementById('cart-count').innerText = count;
            alert(title + " telah ditambahkan ke keranjang!");
        }
        
        function showCart() {
            alert("Jumlah buku di keranjang: " + count);
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
        <button type="button" class="btn btn-success">Checkout Sekarang</button>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    let cartItems = [];
    let totalPrice = 0;

    function addToCart(title, price) {
    // Logika nambah angka tetap sama
    cartItems.push({judul: title, harga: price});
    totalPrice += parseFloat(price);
    document.getElementById('cart-count').innerText = cartItems.length;

    // INI NOTIFIKASI KERENNYA
    Swal.fire({
        icon: 'success',
        title: 'Buku Ditambahkan!',
        text: title + ' sudah masuk keranjang belanja kamu.',
        showConfirmButton: false,
        timer: 1500, // Ilang sendiri dalam 1.5 detik
        position: 'center', // Bisa ganti 'top-end' kalau mau di pojok
        borderRadius: '15px'
    });
}p

    function showCartItems() {
        let listHtml = "";
        if (cartItems.length === 0) {
            listHtml = "<li class='list-group-item text-center'>Keranjang masih kosong</li>";
        } else {
            cartItems.forEach((item, index) => {
                listHtml += `<li class='list-group-item d-flex justify-content-between align-items-center'>
                                ${item.title}
                                <span class='badge bg-primary rounded-pill'>Rp ${item.price.toLocaleString()}</span>
                             </li>`;
            });
        }
        document.getElementById('cart-list').innerHTML = listHtml;
        document.getElementById('cart-total').innerText = "Rp " + totalPrice.toLocaleString();
        
        // Munculkan Modal
        var myModal = new bootstrap.Modal(document.getElementById('cartModal'));
        myModal.show();
    }
</script>
</body>
</html>

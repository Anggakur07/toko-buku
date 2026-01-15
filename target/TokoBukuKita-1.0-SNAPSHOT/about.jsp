<%-- 
    Document   : about
    Created on : 13 Jan 2026, 20.26.08
    Author     : MyBook Hype AMD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>About Us - BukuKita</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f8f9fa; }
        .main-nav { background: white; border-bottom: 3px solid #ffc107; padding: 15px 0; }
        .logo { font-size: 28px; font-weight: 800; color: #007bff; text-decoration: none; }
        .logo span { color: #ffc107; }
    </style>
</head>
<body>
    <nav class="main-nav mb-5">
        <div class="container d-flex justify-content-between">
            <a href="index.jsp" class="logo">Buku<span>Kita</span></a>
            <div class="d-flex gap-4">
                <a href="index.jsp" class="nav-link">Home</a>
                <a href="about.jsp" class="nav-link">About Us</a>
                <a href="gallery.jsp" class="nav-link">Gallery</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <h1>Tentang Kami</h1>
        <p>BukuKita adalah toko buku online terlengkap...</p>
    </div>
</body>
</html>
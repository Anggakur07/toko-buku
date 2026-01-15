<%-- 
    Document   : login
    Created on : 13 Jan 2026, 21.33.55
    Author     : MyBook Hype AMD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Premium | BukuKita</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-blue: #007bff;
            --dark-blue: #0056b3;
            --bg-gradient: linear-gradient(135deg, #007bff 0%, #00d4ff 100%);
        }

        * {
            margin: 0; padding: 0; box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: var(--bg-gradient);
            background-attachment: fixed;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        /* Ornamen Dekorasi Latar Belakang */
        .circle {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            z-index: 0;
        }
        .circle-1 { width: 300px; height: 300px; top: -100px; right: -50px; }
        .circle-2 { width: 200px; height: 200px; bottom: -50px; left: -50px; }

        .container {
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 400px;
            padding: 20px;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .brand-logo {
            font-size: 32px;
            font-weight: 600;
            color: var(--primary-blue);
            margin-bottom: 5px;
            display: inline-block;
        }
        
        .brand-logo span { color: #f1c40f; } /* Warna kuning seperti logo BukuKita */

        .login-card h2 {
            font-size: 18px;
            color: #555;
            margin-bottom: 30px;
            font-weight: 400;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            font-size: 13px;
            font-weight: 500;
            color: #666;
            margin-left: 5px;
        }

        .input-box {
            width: 100%;
            padding: 12px 15px;
            background: #f8f9fa;
            border: 2px solid transparent;
            border-radius: 12px;
            outline: none;
            font-size: 14px;
            transition: all 0.3s;
            margin-top: 5px;
        }

        .input-box:focus {
            border-color: var(--primary-blue);
            background: #fff;
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.1);
        }

        .btn-login {
            width: 100%;
            padding: 14px;
            background: var(--primary-blue);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.3);
        }

        .btn-login:hover {
            background: var(--dark-blue);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 123, 255, 0.4);
        }

        .error-alert {
            background: #fee2e2;
            color: #dc2626;
            padding: 10px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 13px;
            border: 1px solid #fecaca;
        }

        .footer {
            margin-top: 25px;
            font-size: 13px;
            color: #777;
        }

        .footer a {
            color: var(--primary-blue);
            text-decoration: none;
            font-weight: 600;
        }

        .footer a:hover { text-decoration: underline; }
    </style>
</head>
<body>

    <div class="circle circle-1"></div>
    <div class="circle circle-2"></div>

    <div class="container">
        <div class="login-card">
            <div class="brand-logo">Buku<span>Kita</span></div>
            <h2>Selamat Datang Kembali</h2>

            <% if(request.getParameter("status") != null) { %>
                <div class="error-alert">
                    Username atau password salah!
                </div>
            <% } %>

            <form action="loginservlet" method="POST">
                <div class="form-group">
                    <label>Username</label>
                    <input type="text" name="username" class="input-box" placeholder="Contoh: admin" required>
                </div>
                
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" class="input-box" placeholder="••••••••" required>
                </div>

                <button type="submit" class="btn-login">Masuk ke Akun</button>
            </form>

            <div class="footer">
                Belum punya akun? <a href="register.jsp">Daftar Sekarang</a>
            </div>
        </div>
    </div>

</body>
</html>
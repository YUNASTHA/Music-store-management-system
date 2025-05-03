<%@ page session="true" %>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

<style>
    .footer {
        background-color: #0f1c2e;
        color: #cbd5e1;
        font-family: 'Inter', sans-serif;
        padding: 60px 40px 30px;
        border-top: 1px solid #2a2a2a;
    }

    .footer-container {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        gap: 40px;
        max-width: 1200px;
        margin: 0 auto;
    }

    .footer-column {
        flex: 1 1 200px;
        min-width: 180px;
    }

    .footer h3 {
        color: #f0f4ff;
        font-size: 17px;
        margin-bottom: 16px;
        font-weight: 600;
    }

    .footer p {
        font-size: 14px;
        line-height: 1.6;
        color: #94a3b8;
    }

    .footer a {
        color: #cbd5e1;
        text-decoration: none;
        display: block;
        margin-bottom: 10px;
        font-size: 14px;
        transition: color 0.3s ease;
    }

    .footer a:hover {
        color: #61a5ff;
    }

    .footer-bottom {
        text-align: center;
        margin-top: 40px;
        font-size: 13px;
        color: #94a3b8;
        border-top: 1px solid #2a2a2a;
        padding-top: 20px;
    }

    .social-icons {
        display: flex;
        gap: 12px;
        margin-bottom: 10px;
    }

    .social-icons a {
        color: #cbd5e1;
        font-size: 18px;
        transition: color 0.3s ease;
    }

    .social-icons a:hover {
        color: #61a5ff;
    }
</style>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-column">
            <h3>Melody Music</h3>
            <p>Your one-stop shop for all musical instruments and accessories.</p>
        </div>

        <div class="footer-column">
            <h3>Quick Links</h3>
            <a href="home">Home</a>
            <a href="">Products</a>
            <a href="">About Us</a>
            <a href="">Contact Us</a>
        </div>

        <div class="footer-column">
            <h3>Customer Service</h3>
            <a href="">FAQ</a>
            <a href="">Shipping Policy</a>
            <a href="">Returns & Refunds</a>
            <a href="">Privacy Policy</a>
        </div>

        <div class="footer-column">
            <h3>Connect With Us</h3>
            <div class="social-icons">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
            </div>
            <p>Email: tunecart@music.com</p>
            <p>Phone: +977 9800000000</p>
        </div>
    </div>

    <div class="footer-bottom">
        © 2025 Melody Music. All rights reserved.
    </div>
</footer>

<!-- Font Awesome for icons (if not already included) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

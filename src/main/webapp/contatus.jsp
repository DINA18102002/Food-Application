<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Zomato</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="css/contactus.css">
</head>
<body>

    <header>
        <div class="header-content">
            <i class="fas fa-arrow-left go-back" onclick="window.history.back();"></i> <!-- Link to go back -->
            <h1>Contact Us</h1>
        </div>
    </header>

    <div class="container">
        <h2>Get in Touch with Zomato</h2>
        <p>If you have any questions or need assistance, feel free to contact us through the following channels:</p>

        <ul class="contact-details">
            <li>Email: support@zomato.com</li>
            <li>Phone: +1 800-123-4567</li>
            <li>Address: 123 Food Street, City, Country</li>
        </ul>

        <h3>Customer Help & Complaints</h3>
        <p>Have a question or need assistance? Please fill out the form below, and we will get back to you as soon as possible:</p>

        <form action="submit_contact.jsp" method="POST">
            <div class="form-group">
                <label for="name">Your Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Your Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="message">Your Message</label>
                <textarea id="message" name="message" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <input type="submit" value="Submit">
            </div>
        </form>
    </div>

    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>Zomato</h3>
                <p>Your favorite food delivery partner. Order from the best restaurants in your area.</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="contatus.jsp">Contact</a></li>
                    <li><a href="termsandcondition.jsp">Terms & Conditions</a></li>
                    <li><a href="privacypolicy.jsp">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Contact Us</h3>
                <p>Email: <a href="">support@Zomato.com</a></p>
                <p>Phone: (555) 123-4567</p>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; By continuing past this page, you agree to our Terms of Service, Cookie Policy, Privacy Policy and Content Policies. All trademarks are properties of their respective owners. 2008-2024 © Zomato™ Ltd. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>

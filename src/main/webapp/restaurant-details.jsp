<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.model.Restraunt" %>
<%@ page import="com.foodapp.DAOImpl.RestrauntDAOImpl" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= session.getAttribute("restaurantName") %> Dashboard</title>
    <link rel="stylesheet" href="css/restrauntdetails.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <header>
        <nav>
            <div class="container">
                <a href="#" class="logo"><%= session.getAttribute("restaurantName") %></a>
                <ul class="nav-links">
                    <li><a href="#about">About</a></li>
                    <li><a href="#features">Features</a></li>
                    <li><a href="#gallery">Gallery</a></li>
                    <li><a href="#testimonials">Testimonials</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
                <a href="restaurantsettings.jsp" class="settings-btn">
                    <i class="fas fa-cogs"></i> Settings
                </a>
            </div>
        </nav>
    </header>

    <main>
        <section id="hero" class="hero-section">
            <div class="container">
                <h1>Welcome to <%= session.getAttribute("restaurantName") %></h1>
                <p>Delicious meals, friendly service, and great vibes</p>
                <a href="javascript:history.back()" class="btn btn-light">
                    <i class="fas fa-arrow-left"></i> Go Back
                </a>
            </div>
        </section>

        <section id="about" class="about-section">
            <div class="container">
                <h2>About Us</h2>
                <div class="about-content">
                    <div class="about-text">
                        <p>At <%= session.getAttribute("restaurantName") %>, we pride ourselves on serving high-quality food with excellent service. Our restaurant is a perfect spot for family gatherings, business meetings, or casual dining.</p>
                        <p>We offer a wide range of dishes that cater to all tastes, from local delicacies to international cuisines. Our chefs use only the freshest ingredients to create mouth-watering dishes that will leave you wanting more.</p>
                    </div>
                    <div class="about-image">
                        <img src="images/restaurantinterior.jpg" alt="Restaurant Interior">
                    </div>
                </div>
            </div>
        </section>

        <section id="features" class="features-section">
            <div class="container">
                <h2>Why Choose Us</h2>
                <div class="features-grid">
                    <div class="feature-item">
                        <i class="fas fa-utensils"></i>
                        <h3>Exquisite Cuisine</h3>
                        <p>Our expert chefs prepare delicious dishes using the finest ingredients.</p>
                    </div>
                    <div class="feature-item">
                        <i class="fas fa-glass-cheers"></i>
                        <h3>Cozy Atmosphere</h3>
                        <p>Enjoy your meal in our warm and inviting dining environment.</p>
                    </div>
                    <div class="feature-item">
                        <i class="fas fa-user-tie"></i>
                        <h3>Professional Staff</h3>
                        <p>Our friendly and attentive staff ensures a memorable dining experience.</p>
                    </div>
                    <div class="feature-item">
                        <i class="fas fa-leaf"></i>
                        <h3>Fresh Ingredients</h3>
                        <p>We source only the freshest, locally-sourced ingredients for our dishes.</p>
                    </div>
                </div>
            </div>
        </section>

        <section id="gallery" class="gallery-section">
            <div class="container">
                <h2>Our Gallery</h2>
                <div class="gallery-grid">
                    <img src="images/menu/chickenbiriyani.jpg" alt="Dish 1">
                    <img src="images/menu/gulabjamun.jpg" alt="Dish 2">
                    <img src="images/menu/crab.jpg" alt="Dish 3">
                    <img src="images/menu/doublecheeseburger.jpg" alt="Dish 4">
                    <img src="images/menu/fish.jpg" alt="Dish 5">
                    <img src="images/menu/grill.jpg" alt="Dish 6">
                </div>
            </div>
        </section>

        <section id="testimonials" class="testimonials-section">
            <div class="container">
                <h2>What Our Customers Say</h2>
                <div class="testimonials-slider">
                    <div class="testimonial">
                        <p>"The food was absolutely delicious, and the service was impeccable. I'll definitely be coming back!"</p>
                        <span class="author">- John Doe</span>
                    </div>
                    <div class="testimonial">
                        <p>"A hidden gem in the city! The atmosphere is cozy, and the menu offers a great variety of dishes."</p>
                        <span class="author">- Jane Smith</span>
                    </div>
                    <div class="testimonial">
                        <p>"I love the attention to detail in every dish. It's clear that the chefs are passionate about their craft."</p>
                        <span class="author">- Mike Johnson</span>
                    </div>
                </div>
            </div>
        </section>

        <section id="contact" class="contact-section">
            <div class="container">
                <h2>Contact Us</h2>
                <div class="contact-grid">
                    <div class="contact-info">
                        <div class="contact-item">
                            <i class="fas fa-phone"></i>
                            <h3>Phone</h3>
                            <p><a href="tel:+1234567890">+1 (234) 567-890</a></p>
                        </div>
                        <div class="contact-item">
                            <i class="fas fa-envelope"></i>
                            <h3>Email</h3>
                            <p><a href="mailto:info@restaurant.com">info@restaurant.com</a></p>
                        </div>
                        <div class="contact-item">
                            <i class="fas fa-map-marker-alt"></i>
                            <h3>Address</h3>
                            <p>123 Restaurant St, City, Country</p>
                        </div>
                    </div>
                    <form class="contact-form">
                        <input type="text" placeholder="Your Name" required>
                        <input type="email" placeholder="Your Email" required>
                        <textarea placeholder="Your Message" required></textarea>
                        <button type="submit" class="btn btn-primary">Send Message</button>
                    </form>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-info">
                    <h3><%= session.getAttribute("restaurantName") %></h3>
                    <p>Delicious food, great atmosphere, unforgettable experiences.</p>
                </div>
                <div class="footer-social">
                    <h3>Follow Us</h3>
                    <div class="social-icons">
                        <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
                        <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
                        <a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
                        <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2023 <%= session.getAttribute("restaurantName") %>. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script src="js/restrauntdetails.js"></script>
</body>
</html>


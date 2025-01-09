<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zomato - Your Favorite Food Delivered</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="js/index.js" defer></script>
</head>
<body>
    <header class="header">
        <div class="container">
            <nav class="nav">
                <a href="#" class="logo">Zomato</a>
                <ul class="nav-links">
                    <li><a href="#" class="get-app">Get the App</a></li>
                    <li><a href="#">Investor Relations</a></li>
                    <li><a href="addrestraunt.jsp">Add restaurant</a></li>
                    <li><a href="login.jsp">Log in</a></li>
                    <li><a href="register.jsp" class="btn-signup">Sign up</a></li>
                </ul>
                <button class="menu-toggle" aria-label="Toggle menu">
                    <span></span>
                    <span></span>
                    <span></span>
                    
                </button>
            </nav>
        </div>
    </header>

    <main>
        <section class="hero">
            <div class="container">
                <h1 class="hero-title">Discover the best food & drinks in Bengaluru</h1>
                <div class="search-container">
                    <div class="location-wrapper">
                        <button class="location-select" aria-haspopup="true" aria-expanded="false">
                            <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                <circle cx="12" cy="10" r="3"></circle>
                            </svg>
                            <span class="location-text">Bengaluru</span>
                            <svg class="icon-arrow" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="6 9 12 15 18 9"></polyline>
                            </svg>
                        </button>
                        <div class="location-dropdown" hidden>
                            <div class="detect-location">
                                <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M12 22s-8-4.5-8-11.8A8 8 0 0 1 12 2a8 8 0 0 1 8 8.2c0 7.3-8 11.8-8 11.8z"></path>
                                    <circle cx="12" cy="10" r="3"></circle>
                                </svg>
                                <div>
                                    <div class="detect-text">Detect current location</div>
                                    <div class="using-gps">Using GPS</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="search-input-wrapper">
                        <svg class="icon search-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="11" cy="11" r="8"></circle>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                        </svg>
                        <input type="text" class="search-input" placeholder="Search for restaurant, cuisine or a dish">
                    </div>
                </div>
            </div>
        </section>

        <section class="categories" id="explore">
            <div class="container">
                <h2 class="section-title">Popular Categories</h2>
                <p class="section-subtitle">Explore our wide range of cuisines</p>
                <div class="category-grid">
                    <a href="#" class="category-card">
                        <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591" alt="Pizza" class="category-img">
                        <div class="category-info">
                            <h3>Pizza</h3>
                            <p>20+ Restaurants</p>
                        </div>
                    </a>
                    <a href="#" class="category-card">
                        <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd" alt="Burgers" class="category-img">
                        <div class="category-info">
                            <h3>Burgers</h3>
                            <p>15+ Restaurants</p>
                        </div>
                    </a>
                    <a href="#" class="category-card">
                        <img src="https://images.unsplash.com/photo-1512058564366-18510be2db19" alt="Asian" class="category-img">
                        <div class="category-info">
                            <h3>Asian</h3>
                            <p>25+ Restaurants</p>
                        </div>
                    </a>
                    <a href="#" class="category-card">
                        <img src="https://images.unsplash.com/photo-1599974579688-8dbdd335c77f" alt="Desserts" class="category-img">
                        <div class="category-info">
                            <h3>Desserts</h3>
                            <p>30+ Restaurants</p>
                        </div>
                    </a>
                    <a href="#" class="category-card">
                        <img src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c" alt="Healthy" class="category-img">
                        <div class="category-info">
                            <h3>Healthy</h3>
                            <p>18+ Restaurants</p>
                        </div>
                    </a>
                    <a href="#" class="category-card">
                        <img src="https://images.unsplash.com/photo-1555939594-58d7cb561ad1" alt="Indian" class="category-img">
                        <div class="category-info">
                            <h3>Indian</h3>
                            <p>40+ Restaurants</p>
                        </div>
                    </a>
                </div>
            </div>
        </section>

        <section class="how-it-works">
            <div class="container">
                <h2 class="section-title">How It Works</h2>
                <p class="section-subtitle">Easy steps to get your favorite food</p>
                <div class="steps-grid">
                    <div class="step-card">
                        <div class="step-number">1</div>
                        <h3>Choose Location</h3>
                        <p>Enter your address to find nearby restaurants</p>
                    </div>
                    <div class="step-card">
                        <div class="step-number">2</div>
                        <h3>Order Food</h3>
                        <p>Browse menus and select your favorite dishes</p>
                    </div>
                    <div class="step-card">
                        <div class="step-number">3</div>
                        <h3>Fast Delivery</h3>
                        <p>Get your food delivered in minutes</p>
                    </div>
                    <div class="step-card">
                        <div class="step-number">4</div>
                        <h3>Enjoy Your Meal</h3>
                        <p>Savor your delicious food in the comfort of your home</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="featured-restaurants">
            <div class="container">
                <h2 class="section-title">Featured Restaurants</h2>
                <p class="section-subtitle">Discover top-rated dining experiences</p>
                <div class="restaurant-grid">
                    <a href="#" class="restaurant-card">
                        <img src="https://images.unsplash.com/photo-1517248135467-4c7edcad34c4" alt="Restaurant 1" class="restaurant-img">
                        <div class="restaurant-info">
                            <h3>The Fusion Kitchen</h3>
                            <p>Asian, Continental</p>
                            <div class="rating">
                                <span class="stars">★★★★☆</span>
                                <span class="reviews">(120+ reviews)</span>
                            </div>
                        </div>
                    </a>
                    <a href="#" class="restaurant-card">
                        <img src="https://images.unsplash.com/photo-1544148103-0773bf10d330" alt="Restaurant 2" class="restaurant-img">
                        <div class="restaurant-info">
                            <h3>Bella Italia</h3>
                            <p>Italian, Pizza</p>
                            <div class="rating">
                                <span class="stars">★★★★★</span>
                                <span class="reviews">(200+ reviews)</span>
                            </div>
                        </div>
                    </a>
                    <a href="#" class="restaurant-card">
                        <img src="https://images.unsplash.com/photo-1514933651103-005eec06c04b" alt="Restaurant 3" class="restaurant-img">
                        <div class="restaurant-info">
                            <h3>Spice Route</h3>
                            <p>Indian, Vegetarian</p>
                            <div class="rating">
                                <span class="stars">★★★★☆</span>
                                <span class="reviews">(150+ reviews)</span>
                            </div>
                        </div>
                    </a>
                    <a href="#" class="restaurant-card">
                        <img src="https://images.unsplash.com/photo-1504754524776-8f4f37790ca0" alt="Restaurant 4" class="restaurant-img">
                        <div class="restaurant-info">
                            <h3>Sushi Master</h3>
                            <p>Japanese, Sushi</p>
                            <div class="rating">
                                <span class="stars">★★★★★</span>
                                <span class="reviews">(180+ reviews)</span>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </section>
        
        <!-- Add this section after the featured-restaurants section -->
<section class="popular-dishes">
    <div class="container">
        <h2 class="section-title">Popular Dishes</h2>
        <p class="section-subtitle">Explore the most loved dishes in your area</p>
        <div class="dishes-grid">
            <div class="dish-card">
                <img src="https://images.unsplash.com/photo-1604382355076-af4b0eb60143?auto=format&fit=crop&w=300&q=80" alt="Butter Chicken" class="dish-img">
                <div class="dish-info">
                    <h3>Butter Chicken</h3>
                    <p>Rich and creamy chicken curry</p>
                    <span class="dish-price">₹250</span>
                </div>
            </div>
            <div class="dish-card">
                <img src="https://images.unsplash.com/photo-1593560708920-61dd98c46a4e?auto=format&fit=crop&w=300&q=80" alt="Margherita Pizza" class="dish-img">
                <div class="dish-info">
                    <h3>Margherita Pizza</h3>
                    <p>Classic Italian pizza with fresh basil</p>
                    <span class="dish-price">₹200</span>
                </div>
            </div>
            <div class="dish-card">
                <img src="https://images.unsplash.com/photo-1626645738196-c2a7c87a8f58?auto=format&fit=crop&w=300&q=80" alt="Vegetable Biryani" class="dish-img">
                <div class="dish-info">
                    <h3>Vegetable Biryani</h3>
                    <p>Aromatic rice dish with mixed vegetables</p>
                    <span class="dish-price">₹180</span>
                </div>
            </div>
            <div class="dish-card">
                <img src="https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?auto=format&fit=crop&w=300&q=80" alt="Sushi Platter" class="dish-img">
                <div class="dish-info">
                    <h3>Sushi Platter</h3>
                    <p>Assorted sushi rolls and sashimi</p>
                    <span class="dish-price">₹400</span>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="testimonials">
    <div class="container">
        <h2 class="section-title">What Our Customers Say</h2>
        <p class="section-subtitle">Read about experiences from our satisfied customers</p>
        <div class="testimonials-grid">
            <div class="testimonial-card">
                <div class="testimonial-content">
                    <p>"Zomato has made ordering food so convenient! The variety of restaurants and cuisines available is amazing. I love how easy it is to find new places to try."</p>
                </div>
                <div class="testimonial-author">
                    <img src="https://randomuser.me/api/portraits/women/65.jpg" alt="Sarah M." class="author-img">
                    <div class="author-info">
                        <h4>Sarah M.</h4>
                        <p>Food Enthusiast</p>
                    </div>
                </div>
            </div>
            <div class="testimonial-card">
                <div class="testimonial-content">
                    <p>"As a busy professional, Zomato has been a lifesaver. The delivery is always on time, and the food quality is consistently great. Highly recommended!"</p>
                </div>
                <div class="testimonial-author">
                    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Rahul K." class="author-img">
                    <div class="author-info">
                        <h4>Rahul K.</h4>
                        <p>Software Engineer</p>
                    </div>
                </div>
            </div>
            <div class="testimonial-card">
                <div class="testimonial-content">
                    <p>"I love how Zomato supports local restaurants. It's helped me discover so many hidden gems in my neighborhood that I wouldn't have known about otherwise."</p>
                </div>
                <div class="testimonial-author">
                    <img src="https://randomuser.me/api/portraits/women/45.jpg" alt="Priya S." class="author-img">
                    <div class="author-info">
                        <h4>Priya S.</h4>
                        <p>Local Food Blogger</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

        
    </main>

    <footer class="footer">
        <div class="container">
            <div class="footer-grid">
                <div class="footer-section">
                    <h3>Zomato</h3>
                    <p>Your favorite food delivery partner. Order from the best restaurants in your area.</p>
                    <div class="social-links">
                        <a href="#" aria-label="Facebook"><svg class="icon" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2C6.477 2 2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.879V14.89h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.989C18.343 21.129 22 16.99 22 12c0-5.523-4.477-10-10-10z"/></svg></a>
                        <a href="#" aria-label="Twitter"><svg class="icon" fill="currentColor" viewBox="0 0 24 24"><path d="M23 3a10.9 10.9 0 01-3.14 1.53 4.48 4.48 0 00-7.86 3v1A10.66 10.66 0 013 4s-4 9 5 13a11.64 11.64 0 01-7 2c9 5 20 0 20-11.5a4.5 4.5 0 00-.08-.83A7.72 7.72 0 0023 3z"/></svg></a>
                        <a href="#" aria-label="Instagram"><svg class="icon" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2c2.717 0 3.056.01 4.122.06 1.065.05 1.79.217 2.428.465.66.254 1.216.598 1.772 1.153.509.5.902 1.105 1.153 1.772.247.637.415 1.363.465 2.428.047 1.066.06 1.405.06 2.122 2.122.06 2.496.11 3.388.444C22.343 6.051 24 8.583 24 12c0 5.522-4.477 10-10 10S4 17.522 4 12c0-5.523 4.477-10 10-10zm0 3.75a6.25 6.25 0 100 12.5 6.25 6.25 0 000-12.5zm0 2a4.25 4.25 0 110 8.5 4.25 4.25 0 010-8.5zm6.5-3a1.5 1.5 0 100 3 1.5 1.5 0 000-3z"/></svg></a>
                    </div>
                </div>
                <div class="footer-section">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="aboutus.jsp">About Us</a></li>
                        <li><a href="contactus.jsp">Contact</a></li>
                        <li><a href="termsandcondition.jsp">Terms & Conditions</a></li>
                        <li><a href="privacypolicy.jsp">Privacy Policy</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">Blog</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Contact Us</h3>
                    <p>Email: <a href="mailto:support@zomato.com">support@zomato.com</a></p>
                    <p>Phone: (555) 123-4567</p>
                    <p>Address: 123 Food Street, Bengaluru, India</p>
                </div>
                <div class="footer-section">
                    <h3>Download App</h3>
                    <div class="app-links">
                        <a href="#" class="app-store-badge">
                            <img src="https://yourwebsite.com/images/app-store-badge.png" alt="Download on the App Store">
                        </a>
                        <a href="#" class="google-play-badge">
                            <img src="https://yourwebsite.com/images/google-play-badge.png" alt="Get it on Google Play">
                        </a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2008-2024 Zomato™ Ltd. All rights reserved.</p>
                <p>By continuing past this page, you agree to our Terms of Service, Cookie Policy, Privacy Policy and Content Policies. All trademarks are properties of their respective owners.</p>
            </div>
        </div>
    </footer>
</body>
</html>


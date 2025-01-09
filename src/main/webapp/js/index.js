document.addEventListener('DOMContentLoaded', () => {
  const menuToggle = document.querySelector('.menu-toggle');
  const navLinks = document.querySelector('.nav-links');
  const locationSelect = document.querySelector('.location-select');
  const locationDropdown = document.querySelector('.location-dropdown');

  // Toggle mobile menu
  menuToggle.addEventListener('click', () => {
    navLinks.classList.toggle('active');
  });

  // Toggle location dropdown
  locationSelect.addEventListener('click', (e) => {
    e.stopPropagation();
    locationDropdown.hidden = !locationDropdown.hidden;
    locationSelect.setAttribute('aria-expanded', !locationDropdown.hidden);
  });

  // Close location dropdown when clicking outside
  document.addEventListener('click', (event) => {
    if (!locationSelect.contains(event.target) && !locationDropdown.contains(event.target)) {
      locationDropdown.hidden = true;
      locationSelect.setAttribute('aria-expanded', 'false');
    }
  });

  // Detect location
  const detectLocation = document.querySelector('.detect-location');
  detectLocation.addEventListener('click', () => {
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition((position) => {
        // Here you would typically send the coordinates to your backend
        // and get the city name. For this example, we'll just show an alert.
        alert(`Latitude: ${position.coords.latitude}, Longitude: ${position.coords.longitude}`);
        locationDropdown.hidden = true;
      }, () => {
        alert("Unable to retrieve your location");
      });
    } else {
      alert("Geolocation is not supported by your browser");
    }
  });

  // Smooth scrolling for anchor links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      document.querySelector(this.getAttribute('href')).scrollIntoView({
        behavior: 'smooth'
      });
    });
  });

  // Lazy loading images
  if ('loading' in HTMLImageElement.prototype) {
    const images = document.querySelectorAll('img[loading="lazy"]');
    images.forEach(img => {
      img.src = img.dataset.src;
    });
  } else {
    // Fallback for browsers that don't support lazy loading
    const script = document.createElement('script');
    script.src = 'https://cdnjs.cloudflare.com/ajax/libs/lozad.js/1.16.0/lozad.min.js';
    script.async = true;
    script.onload = function() {
      const observer = lozad();
      observer.observe();
    };
    document.body.appendChild(script);
  }

  // Add animation on scroll
  const animateOnScroll = () => {
    const elements = document.querySelectorAll('.animate-on-scroll');
    elements.forEach(element => {
      const elementTop = element.getBoundingClientRect().top;
      const elementBottom = element.getBoundingClientRect().bottom;
      if (elementTop < window.innerHeight && elementBottom > 0) {
        element.classList.add('animated');
      }
    });
  };

  window.addEventListener('scroll', animateOnScroll);
  animateOnScroll(); // Initial check on page load
});


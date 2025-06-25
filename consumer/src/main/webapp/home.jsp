<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String token = (String) session.getAttribute("token");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wanderlust Adventures | Explore the World</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .hero {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://images.unsplash.com/photo-1506929562872-bb421503ef21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            height: 90vh;
        }

        .destination-card:hover .destination-overlay {
            opacity: 1;
            transform: translateY(0);
        }

        .destination-overlay {
            opacity: 0;
            transform: translateY(20px);
            transition: all 0.3s ease;
        }

        .testimonial-card {
            transition: all 0.3s ease;
        }

        .testimonial-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .parallax {
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
</head>
<body class="font-sans">
<!-- Navigation -->
<nav class="bg-white shadow-lg sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
            <div class="flex items-center">
                <div class="flex-shrink-0 flex items-center">
                    <i class="fas fa-plane-departure text-blue-600 text-2xl mr-2"></i>
                    <span class="text-xl font-bold text-blue-600">Wanderlust</span>
                </div>
            </div>
            <div class="hidden md:flex items-center space-x-8">
                <a href="#" class="text-gray-800 hover:text-blue-600 px-3 py-2 font-medium">Home</a>
<%--                <a href="#destinations" class="text-gray-800 hover:text-blue-600 px-3 py-2 font-medium">Destinations</a>--%>
<%--                <a href="#services" class="text-gray-800 hover:text-blue-600 px-3 py-2 font-medium">Services</a>--%>
<%--                <a href="#about" class="text-gray-800 hover:text-blue-600 px-3 py-2 font-medium">About</a>--%>
<%--                <a href="#contact" class="text-gray-800 hover:text-blue-600 px-3 py-2 font-medium">Contact</a>--%>
            </div>
            <div class="md:hidden flex items-center">
                <button id="menu-btn" class="text-gray-800 hover:text-blue-600 focus:outline-none">
                    <i class="fas fa-bars text-2xl"></i>
                </button>
            </div>
        </div>
    </div>

    <!-- Mobile menu -->
    <div id="mobile-menu" class="hidden md:hidden bg-white shadow-lg">
        <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
            <a href="#" class="block px-3 py-2 text-gray-800 hover:text-blue-600 font-medium">Home</a>
            <a href="#destinations" class="block px-3 py-2 text-gray-800 hover:text-blue-600 font-medium">Destinations</a>
            <a href="#services" class="block px-3 py-2 text-gray-800 hover:text-blue-600 font-medium">Services</a>
            <a href="#about" class="block px-3 py-2 text-gray-800 hover:text-blue-600 font-medium">About</a>
            <a href="#contact" class="block px-3 py-2 text-gray-800 hover:text-blue-600 font-medium">Contact</a>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero flex items-center justify-center text-white">
    <div class="text-center px-4">
        <h1 class="text-4xl md:text-6xl font-bold mb-6">Discover Your Next Adventure</h1>
        <p class="text-xl md:text-2xl mb-8 max-w-3xl mx-auto">Explore the world's most breathtaking destinations with our expert travel services</p>
        <div class="flex flex-col sm:flex-row justify-center gap-4">
            <button class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-6 rounded-full transition duration-300">
                Explore Destinations
            </button>
            <button class="bg-transparent hover:bg-white hover:text-blue-600 text-white font-bold py-3 px-6 border-2 border-white rounded-full transition duration-300">
                Learn More
            </button>
        </div>
    </div>
</section>

<!-- Search Section -->
<section class="bg-white py-12 -mt-16 relative z-10">
    <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="bg-white rounded-xl shadow-xl p-6 md:p-8">
            <h2 class="text-2xl font-bold text-gray-800 mb-6">Find Your Perfect Trip</h2>
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                <div class="relative">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="keyword">Destination</label>
                    <div class="relative">
                        <input type="text" id="keyword" placeholder="Where to?" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                        <i class="fas fa-map-marker-alt absolute right-3 top-3 text-gray-400"></i>
                    </div>
                </div>
                <div class="flex items-end">
                    <button class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-4 rounded-lg transition duration-300">
                        Search <i class="fas fa-search ml-2"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Popular Destinations -->
<section id="destinations" class="py-16 bg-gray-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-12">
            <h2 class="text-3xl font-bold text-gray-800 mb-4">Popular Destinations</h2>
            <p class="text-gray-600 max-w-2xl mx-auto">
                Discover our most sought-after travel destinations that will leave you breathless
            </p>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
            <c:forEach var="place" items="${places}">
                <div class="destination-card relative overflow-hidden rounded-xl shadow-lg h-96">
                    <img src="${pageContext.request.contextPath}/${place.imageUrls[0]}"
                         alt="${place.placeName}" class="w-full h-full object-cover">
                    <div class="destination-overlay absolute inset-0 bg-gradient-to-t from-black to-transparent flex flex-col justify-end p-6">
                        <h3 class="text-white text-2xl font-bold mb-2">${place.placeName}</h3>
                        <p class="text-gray-200 mb-4">${place.description}</p>
                        <div class="flex justify-between items-center">
                            <span class="text-white font-bold">${place.averageRating} ★</span>
                            <a href="place-detail?id=${place.id}" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-full text-sm transition duration-300">
                                Explore <i class="fas fa-arrow-right ml-1"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="text-center mt-12">
            <a href="places" class="bg-transparent hover:bg-blue-600 text-blue-600 hover:text-white font-bold py-3 px-6 border-2 border-blue-600 rounded-full transition duration-300">
                View All Destinations <i class="fas fa-arrow-right ml-2"></i>
            </a>
        </div>
    </div>
</section>

<!-- Services Section -->
<section id="services" class="py-16 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-12">
            <h2 class="text-3xl font-bold text-gray-800 mb-4">Our Travel Services</h2>
            <p class="text-gray-600 max-w-2xl mx-auto">Comprehensive travel solutions tailored to your needs</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- Service 1 -->
            <div class="bg-gray-50 p-8 rounded-xl shadow-md hover:shadow-xl transition duration-300">
                <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mb-6">
                    <i class="fas fa-plane text-blue-600 text-2xl"></i>
                </div>
                <h3 class="text-xl font-bold text-gray-800 mb-3">Flight Bookings</h3>
                <p class="text-gray-600 mb-4">We find the best flight deals with major airlines worldwide to get you the most competitive prices.</p>
                <a href="#" class="text-blue-600 font-medium flex items-center">
                    Learn more <i class="fas fa-arrow-right ml-2"></i>
                </a>
            </div>

            <!-- Service 2 -->
            <div class="bg-gray-50 p-8 rounded-xl shadow-md hover:shadow-xl transition duration-300">
                <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mb-6">
                    <i class="fas fa-hotel text-blue-600 text-2xl"></i>
                </div>
                <h3 class="text-xl font-bold text-gray-800 mb-3">Hotel Reservations</h3>
                <p class="text-gray-600 mb-4">From luxury resorts to budget stays, we have partnerships with hotels globally for exclusive rates.</p>
                <a href="#" class="text-blue-600 font-medium flex items-center">
                    Learn more <i class="fas fa-arrow-right ml-2"></i>
                </a>
            </div>

            <!-- Service 3 -->
            <div class="bg-gray-50 p-8 rounded-xl shadow-md hover:shadow-xl transition duration-300">
                <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mb-6">
                    <i class="fas fa-route text-blue-600 text-2xl"></i>
                </div>
                <h3 class="text-xl font-bold text-gray-800 mb-3">Custom Itineraries</h3>
                <p class="text-gray-600 mb-4">Our travel experts craft personalized itineraries based on your interests, budget, and travel style.</p>
                <a href="#" class="text-blue-600 font-medium flex items-center">
                    Learn more <i class="fas fa-arrow-right ml-2"></i>
                </a>
            </div>
        </div>
    </div>
</section>

<!-- Parallax Section -->
<section class="parallax py-32" style="background-image: url('https://images.unsplash.com/photo-1508672019048-805c876b67e2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1519&q=80');">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center text-white">
        <h2 class="text-3xl md:text-4xl font-bold mb-6">Ready for Your Next Adventure?</h2>
        <p class="text-xl mb-8">Let us handle the details while you focus on making memories that will last a lifetime.</p>
        <button class="bg-white hover:bg-gray-100 text-blue-600 font-bold py-3 px-8 rounded-full text-lg transition duration-300">
            Get Started Today
        </button>
    </div>
</section>

<!-- Testimonials -->
<section class="py-16 bg-gray-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-12">
            <h2 class="text-3xl font-bold text-gray-800 mb-4">What Our Travelers Say</h2>
            <p class="text-gray-600 max-w-2xl mx-auto">Hear from our satisfied customers about their experiences</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- Testimonial 1 -->
            <div class="testimonial-card bg-white p-8 rounded-xl shadow-md">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 rounded-full overflow-hidden mr-4">
                        <img src="https://randomuser.me/api/portraits/women/32.jpg" alt="Sarah Johnson" class="w-full h-full object-cover">
                    </div>
                    <div>
                        <h4 class="font-bold text-gray-800">Sarah Johnson</h4>
                        <div class="flex text-yellow-400">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>
                <p class="text-gray-600 italic">"The trip to Bali organized by Wanderlust was absolutely perfect! Every detail was taken care of, and we had the most relaxing vacation. Will definitely use their services again!"</p>
            </div>

            <!-- Testimonial 2 -->
            <div class="testimonial-card bg-white p-8 rounded-xl shadow-md">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 rounded-full overflow-hidden mr-4">
                        <img src="https://randomuser.me/api/portraits/men/75.jpg" alt="Michael Chen" class="w-full h-full object-cover">
                    </div>
                    <div>
                        <h4 class="font-bold text-gray-800">Michael Chen</h4>
                        <div class="flex text-yellow-400">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>
                <p class="text-gray-600 italic">"I was skeptical about using a travel agency at first, but Wanderlust proved me wrong. They saved me money on flights and hotels, and their recommendations were spot on!"</p>
            </div>

            <!-- Testimonial 3 -->
            <div class="testimonial-card bg-white p-8 rounded-xl shadow-md">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 rounded-full overflow-hidden mr-4">
                        <img src="https://randomuser.me/api/portraits/women/63.jpg" alt="Emily Rodriguez" class="w-full h-full object-cover">
                    </div>
                    <div>
                        <h4 class="font-bold text-gray-800">Emily Rodriguez</h4>
                        <div class="flex text-yellow-400">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
                <p class="text-gray-600 italic">"Our honeymoon in Santorini was magical thanks to Wanderlust. They arranged everything from airport transfers to romantic dinners with sunset views. Highly recommend!"</p>
            </div>
        </div>
    </div>
</section>

<!-- About Section -->
<section id="about" class="py-16 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
            <div>
                <img src="https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="About Us" class="w-full rounded-xl shadow-lg">
            </div>
            <div>
                <h2 class="text-3xl font-bold text-gray-800 mb-6">About Wanderlust Adventures</h2>
                <p class="text-gray-600 mb-4">Founded in 2010, Wanderlust Adventures has been helping travelers explore the world with ease and confidence. Our team of passionate travel experts has visited over 100 countries, giving us firsthand knowledge to craft unforgettable experiences.</p>
                <p class="text-gray-600 mb-6">We believe travel should be accessible, enjoyable, and transformative. That's why we go above and beyond to ensure every trip we plan meets your expectations and exceeds them.</p>
                <div class="grid grid-cols-2 gap-4 mb-6">
                    <div class="flex items-center">
                        <i class="fas fa-check-circle text-green-500 mr-2"></i>
                        <span class="text-gray-700">100% Satisfaction</span>
                    </div>
                    <div class="flex items-center">
                        <i class="fas fa-check-circle text-green-500 mr-2"></i>
                        <span class="text-gray-700">24/7 Support</span>
                    </div>
                    <div class="flex items-center">
                        <i class="fas fa-check-circle text-green-500 mr-2"></i>
                        <span class="text-gray-700">Best Price Guarantee</span>
                    </div>
                    <div class="flex items-center">
                        <i class="fas fa-check-circle text-green-500 mr-2"></i>
                        <span class="text-gray-700">Local Experts</span>
                    </div>
                </div>
                <button class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-6 rounded-full transition duration-300">
                    Learn More About Us
                </button>
            </div>
        </div>
    </div>
</section>

<!-- Newsletter -->
<section class="py-16 bg-blue-600 text-white">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <h2 class="text-3xl font-bold mb-4">Get Travel Inspiration</h2>
        <p class="text-xl mb-8">Subscribe to our newsletter for exclusive deals, travel tips, and destination guides</p>
        <div class="flex flex-col sm:flex-row gap-4 max-w-md mx-auto">
            <input type="email" placeholder="Your email address" class="flex-grow p-3 rounded-lg focus:outline-none text-gray-800">
            <button class="bg-white hover:bg-gray-100 text-blue-600 font-bold py-3 px-6 rounded-lg transition duration-300">
                Subscribe
            </button>
        </div>
    </div>
</section>

<!-- Contact Section -->
<section id="contact" class="py-16 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-12">
            <h2 class="text-3xl font-bold text-gray-800 mb-4">Contact Us</h2>
            <p class="text-gray-600 max-w-2xl mx-auto">Have questions or ready to plan your next trip? Reach out to our team</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
            <div>
                <form class="space-y-6">
                    <div>
                        <label for="name" class="block text-gray-700 font-medium mb-2">Full Name</label>
                        <input type="text" id="name" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div>
                        <label for="email" class="block text-gray-700 font-medium mb-2">Email Address</label>
                        <input type="email" id="email" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div>
                        <label for="phone" class="block text-gray-700 font-medium mb-2">Phone Number</label>
                        <input type="tel" id="phone" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div>
                        <label for="message" class="block text-gray-700 font-medium mb-2">Your Message</label>
                        <textarea id="message" rows="5" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
                    </div>
                    <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-4 rounded-lg transition duration-300">
                        Send Message
                    </button>
                </form>
            </div>

            <div>
                <div class="bg-gray-50 p-8 rounded-xl shadow-md h-full">
                    <h3 class="text-xl font-bold text-gray-800 mb-6">Our Contact Information</h3>
                    <div class="space-y-6">
                        <div class="flex items-start">
                            <div class="w-10 h-10 bg-blue-100 rounded-full flex items-center justify-center mr-4 mt-1">
                                <i class="fas fa-map-marker-alt text-blue-600"></i>
                            </div>
                            <div>
                                <h4 class="font-medium text-gray-800">Address</h4>
                                <p class="text-gray-600">123 Travel Street, Suite 456<br>New York, NY 10001</p>
                            </div>
                        </div>
                        <div class="flex items-start">
                            <div class="w-10 h-10 bg-blue-100 rounded-full flex items-center justify-center mr-4 mt-1">
                                <i class="fas fa-phone-alt text-blue-600"></i>
                            </div>
                            <div>
                                <h4 class="font-medium text-gray-800">Phone</h4>
                                <p class="text-gray-600">+1 (555) 123-4567<br>Mon-Fri: 9am-6pm EST</p>
                            </div>
                        </div>
                        <div class="flex items-start">
                            <div class="w-10 h-10 bg-blue-100 rounded-full flex items-center justify-center mr-4 mt-1">
                                <i class="fas fa-envelope text-blue-600"></i>
                            </div>
                            <div>
                                <h4 class="font-medium text-gray-800">Email</h4>
                                <p class="text-gray-600">info@wanderlust.com<br>support@wanderlust.com</p>
                            </div>
                        </div>
                    </div>

                    <div class="mt-8">
                        <h4 class="font-medium text-gray-800 mb-4">Follow Us</h4>
                        <div class="flex space-x-4">
                            <a href="#" class="w-10 h-10 bg-blue-600 hover:bg-blue-700 text-white rounded-full flex items-center justify-center transition duration-300">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#" class="w-10 h-10 bg-blue-400 hover:bg-blue-500 text-white rounded-full flex items-center justify-center transition duration-300">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="w-10 h-10 bg-pink-600 hover:bg-pink-700 text-white rounded-full flex items-center justify-center transition duration-300">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a href="#" class="w-10 h-10 bg-blue-700 hover:bg-blue-800 text-white rounded-full flex items-center justify-center transition duration-300">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-gray-900 text-white py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
            <div>
                <div class="flex items-center mb-4">
                    <i class="fas fa-plane-departure text-blue-400 text-2xl mr-2"></i>
                    <span class="text-xl font-bold">Wanderlust</span>
                </div>
                <p class="text-gray-400 mb-4">Making travel dreams come true since 2010.</p>
                <div class="flex space-x-4">
                    <a href="#" class="text-gray-400 hover:text-white transition duration-300">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition duration-300">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition duration-300">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition duration-300">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                </div>
            </div>

            <div>
                <h4 class="text-lg font-semibold mb-4">Quick Links</h4>
                <ul class="space-y-2">
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Home</a></li>
                    <li><a href="#destinations" class="text-gray-400 hover:text-white transition duration-300">Destinations</a></li>
                    <li><a href="#services" class="text-gray-400 hover:text-white transition duration-300">Services</a></li>
                    <li><a href="#about" class="text-gray-400 hover:text-white transition duration-300">About Us</a></li>
                    <li><a href="#contact" class="text-gray-400 hover:text-white transition duration-300">Contact</a></li>
                </ul>
            </div>

            <div>
                <h4 class="text-lg font-semibold mb-4">Services</h4>
                <ul class="space-y-2">
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Flight Bookings</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Hotel Reservations</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Tour Packages</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Visa Assistance</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Travel Insurance</a></li>
                </ul>
            </div>

            <div>
                <h4 class="text-lg font-semibold mb-4">Support</h4>
                <ul class="space-y-2">
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">FAQs</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Help Center</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Terms & Conditions</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Privacy Policy</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition duration-300">Refund Policy</a></li>
                </ul>
            </div>
        </div>

        <div class="border-t border-gray-800 mt-12 pt-8 text-center text-gray-400">
            <p>&copy; 2023 Wanderlust Adventures. All rights reserved.</p>
        </div>
    </div>
</footer>

<!-- Back to Top Button -->
<button id="back-to-top" class="fixed bottom-8 right-8 w-12 h-12 bg-blue-600 text-white rounded-full shadow-lg flex items-center justify-center transition duration-300 opacity-0 invisible">
    <i class="fas fa-arrow-up"></i>
</button>

<script>
    // Mobile menu toggle
    const menuBtn = document.getElementById('menu-btn');
    const mobileMenu = document.getElementById('mobile-menu');

    menuBtn.addEventListener('click', () => {
        mobileMenu.classList.toggle('hidden');
    });

    // Back to top button
    const backToTopBtn = document.getElementById('back-to-top');

    window.addEventListener('scroll', () => {
        if (window.pageYOffset > 300) {
            backToTopBtn.classList.remove('opacity-0', 'invisible');
            backToTopBtn.classList.add('opacity-100', 'visible');
        } else {
            backToTopBtn.classList.remove('opacity-100', 'visible');
            backToTopBtn.classList.add('opacity-0', 'invisible');
        }
    });

    backToTopBtn.addEventListener('click', () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });

    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();

            const targetId = this.getAttribute('href');
            if (targetId === '#') return;

            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - 80,
                    behavior: 'smooth'
                });

                // Close mobile menu if open
                if (!mobileMenu.classList.contains('hidden')) {
                    mobileMenu.classList.add('hidden');
                }
            }
        });
    });

    // Testimonial carousel (simple version)
    let currentTestimonial = 0;
    const testimonials = document.querySelectorAll('.testimonial-card');

    function showTestimonial(index) {
        testimonials.forEach((card, i) => {
            if (i === index) {
                card.classList.remove('hidden');
            } else {
                card.classList.add('hidden');
            }
        });
    }

    // For demo purposes, we'll just rotate testimonials every 5 seconds
    setInterval(() => {
        currentTestimonial = (currentTestimonial + 1) % testimonials.length;
        showTestimonial(currentTestimonial);
    }, 5000);
</script>
</body>
</html>

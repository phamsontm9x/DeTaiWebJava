<%-- 
    Document   : header
    Created on : Aug 27, 2017, 3:18:05 PM
    Author     : hhumo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
    </head>
    <body>

        <header class="header">
            <div class="container">
                <div class="navigation clearfix">
                    <div class="logo"><a href="index.html"><img src="images/logo.png" alt="Automan" class="img-responsive"></a></div> <!-- end .logo -->
                    <div class="login"><a href=""><i class="ion-ios-person"></i></a></div> <!-- end .login -->
                    <div class="contact">
                        <div class="line"></div>
                        <a href="contact-us.html"><i class="fa fa-phone"></i></a>
                    </div> <!-- end .contact -->
                    <nav class="main-nav">
                        <ul class="list-unstyled">
                            <li class="active">
                                <a href="index.html">Home</a>
                                <ul>
                                    <li><a href="index.html">Homepage 1</a></li>
                                    <li><a href="homepage2.html">Homepage 2</a></li>
                                    <li><a href="homepage3.html">Homepage 3</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="add-car-details.html">Add Car</a>
                                <ul>
                                    <li><a href="add-car-details.html">Add Car Details</a></li>
                                    <li><a href="choose-specification.html">Choose Specification</a></li>
                                    <li><a href="contact-details.html">Contact Details</a></li>
                                    <li><a href="photos-videos.html">Photos Videos</a></li>
                                    <li><a href="pay-publish.html">Pay Publish</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="listing-grid-view.html">Cars</a>
                                <ul>
                                    <li><a href="listing-grid-view.html">Listing Grid View</a></li>
                                    <li><a href="listing-list-view.html">Listing List View</a></li>
                                    <li><a href="details.html">Details 1</a></li>
                                    <li><a href="details-1.html">Details 2</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="compare.html">Compare</a>
                                <ul>
                                    <li><a href="compare.html">Compare</a></li>
                                    <li><a href="compare-details.html">Compare Details</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="blog.html">Blog</a>
                                <ul>
                                    <li><a href="blog.html">Blog</a></li>
                                    <li><a href="blog-post.html">Blog Post</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="">Pages</a>
                                <ul>
                                    <li><a href="about-us.html">About Us</a></li>
                                    <li><a href="shortcodes.html">Shortcodes</a></li>
                                </ul>
                            </li>
                            <li><a href="contact-us.html">Contact Us</a></li>
                        </ul>
                    </nav> <!-- end .main-nav -->
                    <a href="" class="responsive-menu-open"><i class="fa fa-bars"></i></a>
                </div> <!-- end .navigation -->
            </div> <!-- end .container -->
        </header> <!-- end .header -->

    </body>
</html>

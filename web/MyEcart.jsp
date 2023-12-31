<%-- 
    Document   : MyEcart
    Created on : Oct 25, 2022, 9:49:49 AM
    Author     : DELL
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            a{
                text-decoration: none;
            }
            table{

                border-collapse: collapse;

            }
            /*           body{
                           text-align: center;
                       
                        }*/
        </style>
        <title>Brnd-logo Website Template | Home :: w3layouts</title>
        \<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <!---- start-smoth-scrolling---->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!---- start-smoth-scrolling---->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    </script>
    <!----webfonts--->
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <script>
        $(function () {
            var pull = $('#pull');
            menu = $('nav ul');
            menuHeight = menu.height();
            $(pull).on('click', function (e) {
                e.preventDefault();
                menu.slideToggle();
            });
            $(window).resize(function () {
                var w = $(window).width();
                if (w > 320 && menu.is(':hidden')) {
                    menu.removeAttr('style');
                }
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <!----top-header---->
        <div class="top-header">
            <div class="logo">
                <a href="index"><img  src="images/logo.png" title="barndlogo" /></a>
            </div>
            <div class="top-header-info">
                <div class="top-contact-info">
                    <ul class="unstyled-list list-inline">
                        <li><span class="phone"> </span>090 - 223 44 66</li>
                        <li><span class="mail"> </span><a href="#">help@trendd.com</a></li>
                        <div class="clearfix"> </div>
                    </ul>
                </div>


                <div class="cart-details">
                    <div class="add-to-cart">
                        <ul class="unstyled-list list-inline">
                            <li>

                                <a href ="MyEcart.jsp">  <span class="cart"> </span>  </a>
                                <c:if test="${size != null}">
                                    <c:if test="${size != 0}">
                                        <p class="img-circle" style="border: 1px solid red; width: 18px; height: 20px ; padding-left: 4px; padding-bottom: 9px; background-color: red;position: relative;color:white; bottom: 41px; left: 17px"> ${size}</p>
                                    </c:if>
                                </c:if>
                                <ul class="cart-sub">

                                    <c:set var = "size" value="${sessionScope.size}"/>
                                    <!--<li><p> Cart(${size})</p></li>-->
                                </ul>
                            </li>
                        </ul>
                    </div>



                    <div class="login-rigister">
                        <ul class="unstyled-list list-inline">
                            <c:if test="${sessionScope.DataEmail == null}">
                                <li><a class="login" href="login.jsp">Login</a></li>
                                <li><a class="rigister" href="register.jsp">REGISTER <span> </span></a></li>
                                </c:if>
                                <c:if test="${sessionScope.DataEmail != null}">
                                <li>  <img src="images/IconUser.png" width ="80 px"  height = "80 px" alt="alt"/></li>
                                <li>${sessionScope.DataEmail}</li>
                                <li><a href = "logout" style ="font-weight: bold; color: orange" >LOG OUT</a></li>
                                </c:if>
                            <div class="clearfix"> </div>
                        </ul>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div style = "display:flex;">



            <div class="top-header-nav"> 
                <!----start-top-nav---->
                <nav class="top-nav main-menu">
                    <ul class="top-nav">
                        <li><a href="index" style="text-decoration: underline" class="rigister">HOME</a></li>
                        <li><a href="product">PRODUCTS</a><span> </span></li>
                        <li><a href="product">CAMPAINGS</a><span> </span></li>
                        <li><a href="admin">DASHBOARD</a><span> </span></li>
                        <li><a href="DashboardP">DASHBOARD</a><span> </span></li>
                        <li><a href="product">ABOUT US</a></li>
                        <div class="clearfix"> </div>
                    </ul>
                    <a href="#" id="pull"><img src="images/nav-icon.png" title="menu" /></a>
                </nav>
            </div>
        </div>
        <h1>Shopping cart online</h1>
        <table border="2px" border-radius='10px' width="70%" class="table table-hover">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Money </th>
                    <th>Action </th>
                </tr>

            </thead>
            <tbody>
                <c:set var="total" value="0" />
                <!--tiếp theo lấy cart để ghi các item-->
                <c:set var = "o" value="${sessionScope.cart}"/>
                <c:set var="t" value="0"/>
                <!--// lấy thuộc tính items đặt tên là i-->
                <c:forEach items ="${o.items}" var="i"> 
                    <c:set var="t" value="${t+1}"/>
                    <tr>
                        <td>${t}</td>
                        <td>${i.product.title}</td>
                        <td><img src="${i.product.thumbnail}" width="100px" height="100px" alt="alt"/></td>
                        <td style = "text-align: center">
                            <button>
                                <a href="process?num=-1&id=${i.product.productId}">-</a>
                            </button>
                            ${i.quantity}
                            <button>
                                <a href="process?num=1&id=${i.product.productId}">+</a>
                            </button>
                        </td>
                        <td>
                            <fmt:formatNumber pattern="##.#" value="${i.price}"/>
                        </td>
                        <td>
                            <fmt:formatNumber pattern="##.#" value="${i.quantity * i.price}"/>
                        </td>
                        <td>
                            <form action = "process" method = "post">
                                <!--xem nó xóa cái gì: hidden id-->
                                <input type="hidden" name="id" value="${i.product.productId}"/>
                                <input type="submit" value="Return value"/>
                            </form>
                        </td>
                        <c:set var="total" value="${total + (i.quantity * i.price)}" />
                    </tr>
                </c:forEach>
            </tbody>

        </table>
        <p></p>
        <form action="${initParam['posturl']}" method="post">
            <input type="hidden" name="cmd" value="_xclick">
            <input type="hidden" name="item_name" value="Shoes">
            <input type="hidden" name="return" value="${initParam['returnurl']}"/>
            <input type="hidden" name="business" value="${initParam['business']}"/>
            <input type="hidden" name="amount" value="${total}">
            <input type="hidden" name="currency_code" value="USD">
            <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif" name="submit" alt="PayPal - The safer, easier way to pay online!">
        </form>

        <h2 style="color:chocolate"> <a href="single-page.jsp" style="text-decoration: underline">Buy Add Products</a></h2>
        <div class="footer">
            <div class="container">
                <div class="col-md-3 footer-logo">
                    <!--<a href="index.html"><img src="images/flogo.png" title="brand-logo" /></a>-->
                </div>
                <div class="col-md-7 footer-links">
                    <ul class="unstyled-list list-inline">
                        <li><a href="#"> Faq</a> <span> </span></li>
                        <li><a href="#"> Terms and Conditions</a> <span> </span></li>
                        <li><a href="#"> Secure Payments</a> <span> </span></li>
                        <li><a href="#"> Shipping</a> <span> </span></li>
                        <li><a href="contact.jsp"> Contact</a> </li>
                        <div class="clearfix"> </div>
                    </ul>
                </div>
                <div class="col-md-2 footer-social">
                    <ul class="unstyled-list list-inline">
                        <li><a class="pin" href="#"><span> </span></a></li>
                        <li><a class="twitter" href="#"><span> </span></a></li>
                        <li><a class="facebook" href="#"><span> </span></a></li>
                        <div class="clearfix"> </div>
                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="clearfix"> </div>
        <!---//footer--->
        <!---copy-right--->
        <div class="copy-right">
            <div class="container">
                <p>Template by <a href="http://w3layouts.com/">W3layouts</a></p>
                <script type="text/javascript">
                    $(document).ready(function () {
                        /*
                         var defaults = {
                         containerID: 'toTop', // fading element id
                         containerHoverID: 'toTopHover', // fading element hover id
                         scrollSpeed: 1200,
                         easingType: 'linear' 
                         };
                         */

                        $().UItoTop({easingType: 'easeOutQuart'});

                    });
                </script>
                <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
            </div>
        </div>
        <!--//copy-right--->
    </div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>

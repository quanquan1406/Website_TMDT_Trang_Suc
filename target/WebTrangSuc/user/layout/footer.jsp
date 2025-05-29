<%-- 
    Document   : footer
    Created on : Dec 1, 2024, 12:00:26 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="static/UserCss/chatbot.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/static/UserCss/layout.css"/>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/libs/fontawesome/css/all.css"/>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/libs/bootstrap5.2/css/bootstrap.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/libs/owlcarousel2.3.4/dist/assets/owl.carousel.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/libs/owlcarousel2.3.4/dist/assets/owl.theme.default.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/libs/owlcarousel2.3.4/dist/assets/owl.theme.green.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/libs/bootstrap5.2/css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div id="chatTooltip">Xin chào, bạn cần tôi giúp gì không?</div>
        <div id="chatLauncher" onclick="toggleChat()"></div>

        <div id="chatContainer">
            <h4 style="text-align: center; margin: 10px;">💬 Chatbot Web-TMĐT Nhóm 5</h4>
            <div id="chatbox"></div>
            <div style="display: flex; align-items: center;">
                <input type="text" id="userInput" placeholder="Nhập tin nhắn...">
                <button id="sendButton" onclick="sendMessage()">Gửi</button>
            </div>
        </div>
        <footer class="section footer">
            <div class="container">
                <div class="contact">
                    <ul>
                        <li>Betekar's Art & Craft</li>
                        <li>Giếng Đáy, Hạ Long, Quảng Ninh</li>
                        <li>Liên hệ:</li>
                        <li><a href="#"><i class="fa-solid fa-phone"></i>0363.636.363</a></li>
                        <li><a href="#"><i class="fa-solid fa-envelope"></i>Tanthuyhoangchau@gmail.com</a></li>
                    </ul>
                </div>
                <div class="socialmedia">
                    <h3>Theo dõi chúng tôi</h3>
                    <a href="#"><i class="fa-brands fa-facebook"></i></a>
                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                    <a href="#"><i class="fa-brands fa-tiktok"></i></a>
                    <a href="#"><i class="fa-brands fa-youtube"></i></a>
                </div>
            </div>
        </footer>
        <script type="text/javascript" src="<%= request.getContextPath() %>/libs/bootstrap5.2/js/bootstrap.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/libs/bootstrap5.2/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/libs/bootstrap5.2/js/bootstrap.bundle.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/libs/jquery/jquery3.6.1.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/libs/owlcarousel2.3.4/dist/owl.carousel.js"></script>
        <script type="text/javascript">
            $('.owl-carousel').owlCarousel({
                loop:true,
                margin:10,
                nav:true,
                autoplay:true,
                autoplayTimeout:1000,
                autoplayHoverPause:true,
                responsive:{
                    0:{
                        items:1
                    },
                    600:{
                        items:3
                    },
                    1000:{
                        items:5
                    }
                }
            })

        </script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/static/js/home.js"></script>
        <script src="static/js/chatbot.js"></script>
    </body>
</html>

<!DOCTYPE HTML><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="log.vo.*" %>
<%@ page import="log.dao.*" %>
<%@ page import="log.factory.DaoFactory" %>
<%@ page import="log.dao.IndexDao" %>
<html>
<head>
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="My Play Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
        Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- bootstrap -->
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' media="all" />
    <!-- //bootstrap -->
    <link href="css/dashboard.css" rel="stylesheet">
    <!-- Custom Theme files -->
    <link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
    <script src="js/jquery-1.11.1.min.js"></script>
    <!--start-smoth-scrolling-->
    <!-- fonts -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
    <!-- //fonts -->
</head>
<body>

    <!--上栏-->
    <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp"><h1><img src="images/logo.png" alt="" /></h1></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <div class="top-search">
                <form  method="get" class="navbar-form navbar-right" action="searchServlet">
                    <input type="text" class="form-control" placeholder="搜索..." name="vname">
                    <input type="submit" value=" ">
                </form>
            </div>
                    <div class="header-top-right">
                        <%--注册--%>
                        <div class="signin">
                            <a href="#small-dialog2" class="play-icon popup-with-zoom-anim">注册</a>
                            <!-- pop-up-box -->
                            <script type="text/javascript" src="js/modernizr.custom.min.js"></script>
                            <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
                            <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
                            <!--//pop-up-box -->
                            <div id="small-dialog2" class="mfp-hide">
                                <h3>创建账户</h3>
                                <div class="social-sits">
                                    <div class="facebook-button">
                                        <a href="#">微信登录</a>
                                    </div>
                                    <div class="chrome-button">
                                        <a href="#">QQ登录</a>
                                    </div>
                                    <div class="button-bottom">
                                        <p>已经有账户了？<a href="#small-dialog" class="play-icon popup-with-zoom-anim">登录</a></p>
                                    </div>
                                </div>
                                <div class="signup">
                                    <form methon="get" action="signupServlet">
                                        <input type="text" class="email" name="userName" placeholder="创建你的昵称" maxlength="6" title="Enter a valid mobile number" />
                                        <input type="text" class="email" name="userPhone" placeholder="手机号码" required="required" maxlength="11"  title="请输入一个可用的手机号码" /><%--pattern="^1(3|4|5|7|8)\d{9}"--%>
                                        <input type="text" class="email" name="userEmail" placeholder="电子邮件" required="required"  title="请输入一个正确的邮箱"/><%--pattern="/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/"--%>
                                        <input type="text" class="email" name="birthday" placeholder="身份证" title="可不填"/>
                                        <input type="text" class="email" name="place" placeholder="地址" title="可不填"/>
                                        <input type="password" name="userPassword" placeholder="密码" required="required" maxlength="15" pattern=".{6,}" title="最少需要6位" autocomplete="off" />
                                        <input type="text" name="verCode" placeholder="验证码"/><img src="captcha" width="130px" height="48px" onclick="changeCode()" id="img"/><br>
                                        <input type="submit"  value="注册"/>
                                    </form>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <script>
                                $(document).ready(function() {
                                    $('.popup-with-zoom-anim').magnificPopup({
                                        type: 'inline',
                                        fixedContentPos: false,
                                        fixedBgPos: true,
                                        overflowY: 'auto',
                                        closeBtnInside: true,
                                        preloader: false,
                                        midClick: true,
                                        removalDelay: 300,
                                        mainClass: 'my-mfp-zoom-in'
                                    });

                                });
                            </script>
                        </div>
                        <%--登录--%>
                        <div class="signin">
                            <a href="#small-dialog" class="play-icon popup-with-zoom-anim">登录</a>
                            <%--登录--%>
                            <div id="small-dialog" class="mfp-hide">
                                <h3>登录</h3>
                                <div class="social-sits">
                                    <div class="facebook-button">
                                        <a href="#">微信登录</a>
                                    </div>
                                    <div class="chrome-button">
                                        <a href="#">QQ登录</a>
                                    </div>
                                    <div class="button-bottom">
                                        <p>还没有账号？<a href="#small-dialog2" class="play-icon popup-with-zoom-anim">注册</a></p>
                                    </div>
                                </div>
                        <div class="signup">
                            <form method="get" action="logServlet">
                                <!--pattern="/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/"-->
                                <input type="text" class="email" name="userEmail" placeholder="电子邮件/手机号码" required="required" title="请输入正确的账号/邮箱"/>
                                <input type="password" name="userPassword" placeholder="密码" required="required" maxlength="15" pattern=".{6,}" title="最少需要6位" autocomplete="off" />
                                <input type="text" name="verCode" placeholder="验证码"/><img src="captcha" width="130px" height="48px" onclick="changeCode()" id="img"/><br>
                                <input type="submit"  value="登录"/>
                            </form>
                            <div class="forgot">
                                <a href="#">忘记密码？</a>
                            </div>
                        </div>
                        <script>
                            /*更改验证码*/
                            function changeCode(){
                                document.getElementById("img").src="captcha?"+Math.random();
                            }
                        </script>
                        <div class="clearfix"> </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="clearfix"> </div>
    </div>
</nav>

    <!--菜单-->
    <div class="col-sm-3 col-md-2 sidebar">
    <div class="top-navigation">
        <div class="t-menu">菜单</div>
        <div class="t-img">
            <img src="images/lines.png" alt="" />
        </div>
        <div class="clearfix"> </div>
    </div>
    <div class="drop-navigation drop-navigation">
        <ul class="nav nav-sidebar">
            <li class="active"><a class="home-icon"><span></span></a></li>
            <li class="active"><a class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
            <li><a href="shows.jsp" class="user-icon"><span class="glyphicon glyphicon-home glyphicon-blackboard" aria-hidden="true"></span>视频学习课程</a></li>
            <!-- script-for-menu -->
            <script>
                $( "li a.menu1" ).click(function() {
                    $( "ul.cl-effect-2" ).slideToggle( 300, function() {
                        // Animation complete.
                    });
                });
            </script>
            <!-- script-for-menu -->
            <script>
                $( "li a.menu" ).click(function() {
                    $( "ul.cl-effect-1" ).slideToggle( 300, function() {
                        // Animation complete.
                    });
                });
            </script>
        </ul>
        <!-- script-for-menu -->
        <script>
            $( ".top-navigation" ).click(function() {
                $( ".drop-navigation" ).slideToggle( 300, function() {
                    // Animation complete.
                });
            });
        </script>
        <div class="side-bottom">
            <div class="side-bottom-icons">
                <ul class="nav2">
                    <li><a href="#" class="facebook"> </a></li>
                    <li><a href="#" class="facebook twitter"> </a></li>
                    <li><a href="#" class="facebook chrome"> </a></li>
                    <li><a href="#" class="facebook dribbble"> </a></li>
                </ul>
            </div>
            <div class="copyright">
                <p>Copyright &copy; 2020.Company name All rights reserved.
            </div>
        </div>
    </div>
</div>

    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <div class="main-grids">
            <div class="top-grids">
                <div class="recommended-info">
                    <h3>请先登录/注册!</h3>
                </div>
                <div class="clearfix"> </div>
            </div>
            <%-- 三个频道 --%>
            <div class="recommended">
                <div class="recommended-grids">
                    <div class="recommended-info">
                        <h3>JAVA</h3>
                    </div>
                    <script src="js/responsiveslides.min.js"></script>
                    <script>
                        // You can also use "$(window).load(function() {"
                        $(function () {
                            // Slideshow 4
                            $("#slider3").responsiveSlides({
                                auto: true,
                                pager: false,
                                nav: true,
                                speed: 500,
                                namespace: "callbacks",
                                before: function () {
                                    $('.events').append("<li>before event fired.</li>");
                                },
                                after: function () {
                                    $('.events').append("<li>after event fired.</li>");
                                }
                            });

                        });
                    </script>
                    <div  id="top" class="callbacks_container">
                        <ul class="rslides" id="slider3">
                            <li>
                                <div class="animated-grids">
                                    <%
                                        IndexDao indexDAO = DaoFactory.getIndexDaoInstance();
                                        List<Vedio> vedioJavaList = null;
                                        vedioJavaList = indexDAO.findVedioByCate("JAVA");
                                        int i = 0;
                                        for(Vedio vedio:vedioJavaList){
                                    %>
                                    <div class="col-md-3 resent-grid recommended-grid slider-first">
                                        <div class="resent-grid-img recommended-grid-img">
                                            <a href="SingleServlet?vedioID=<%=vedio.getId() %>"><img src="<%=vedio.getUrl()%>.png" alt="" /></a>
                                            <div class="time small-time slider-time"><%--时间底色在style.css的483行--%>
                                                <p><%=vedio.getTime() %></p>
                                            </div>
                                        </div>
                                        <div class="resent-grid-info recommended-grid-info">
                                            <h5><a href="SingleServlet?vedioID=<%=vedio.getId() %>" class="title"><%=vedio.getVedioTitle() %></a></h5>
                                            <div class="slid-bottom-grids">
                                                <div class="slid-bottom-grid">
                                                    <p class="author author-info"><a href="#" class="author"><%=vedio.getPublisher() %></a></p>
                                                </div>
                                                <div class="slid-bottom-grid slid-bottom-right">
                                                    <p class="views views-info"><%=vedio.getCount() %> views</p>
                                                </div>
                                                <div class="clearfix"> </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                            i++;
                                            if(i >= 4){ break;}
                                        }
                                    %>
                                    <div class="clearfix"> </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="recommended">
                <div class="recommended-grids">
                    <div class="recommended-info">
                        <h3>C/C++</h3>
                    </div>
                    <%
                        List<Vedio> vedioCList = null;
                        vedioCList = indexDAO.findVedioByCate("C/C++");
                        int j = 0;
                        for(Vedio vedio:vedioCList){
                    %>
                    <div class="col-md-3 resent-grid recommended-grid">
                        <div class="resent-grid-img recommended-grid-img">
                            <a href="SingleServlet?vedioID=<%=vedio.getId() %>"><img src="<%=vedio.getUrl()%>.png" alt="" /></a>
                            <div class="time small-time">
                                <p><%=vedio.getTime() %></p><%--底色在479行--%>
                            </div>

                        </div>
                        <div class="resent-grid-info recommended-grid-info video-info-grid">
                            <h5><a href="SingleServlet?vedioID=<%=vedio.getId() %>" class="title"><%=vedio.getVedioTitle() %></a></h5>
                            <ul>
                                <li><p class="author author-info"><a href="#" class="author"><%=vedio.getPublisher() %></a></p></li>
                                <li class="right-list"><p class="views views-info"><%=vedio.getCount() %> views</p></li>
                            </ul>
                        </div>
                    </div>
                    <%
                            j++;
                            if(j >= 4){ break;}
                        }
                    %>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="recommended">
                <div class="recommended-grids">
                    <div class="recommended-info">
                        <h3>Python</h3>
                    </div>
                    <%
                        List<Vedio> vedioPythonList = null;
                        vedioPythonList = indexDAO.findVedioByCate("Python");
                        int k = 0;
                        for(Vedio vedio:vedioPythonList){
                    %>
                    <div class="col-md-3 resent-grid recommended-grid">
                        <div class="resent-grid-img recommended-grid-img">
                            <a href="SingleServlet?vedioID=<%=vedio.getId() %>"><img src="<%=vedio.getUrl()%>.png" alt="" /></a>
                            <div class="time small-time">
                                <p><%=vedio.getTime() %></p>
                            </div>

                        </div>
                        <div class="resent-grid-info recommended-grid-info video-info-grid">
                            <h5><a href="SingleServlet?vedioID=<%=vedio.getId() %>" class="title"><%=vedio.getVedioTitle() %></a></h5>
                            <ul>
                                <li><p class="author author-info"><a href="#" class="author"><%=vedio.getPublisher() %></a></p></li>
                                <li class="right-list"><p class="views views-info"><%=vedio.getCount() %> views</p></li>
                            </ul>
                        </div>
                    </div>
                    <%
                            k++;
                            if(k >= 4){ break;}
                        }
                    %>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!-- 底部 -->
        <div class="footer">
            <div class="footer-grids">
                <div class="footer-top">
                    <div class="footer-top-nav">
                        <ul>
                            <li><a href="about.jsp">关于我们</a></li>
                            <li><a href="copyright.jsp">版权</a></li>
                            <li><a href="developers.jsp">研发者</a></li>
                        </ul>
                    </div>
                    <div class="footer-bottom-nav">
                        <ul>
                            <li><a href="privacy.jsp">政策与隐私</a></li>
                            <li><a href="#small-dialog4" class="play-icon popup-with-zoom-anim">反馈</a></li>
                            <li><a href="try.jsp">其他</a></li>
                        </ul>
                    </div>
                </div>
                <div class="footer-bottom">
                    <ul>
                        <li class="languages">
                            <select class="form-control bfh-countries" data-country="US">
                                <option value="">选择语言</option>
                                <option>中文</option>
                                <option>English</option>
                                <option>日本語</option>
                            </select>
                        </li>
                        <li class="languages">
                            <select class="form-control bfh-countries">
                                <option value="">选择国家</option>
                                <option value="CHN">中国</option>
                                <option value="ASM">American</option>
                                <option value="JPN">日本</option>
                            </select>
                        </li>
                        <li><a href="history.jsp" class="f-history">历史记录</a></li>
                        <li><a href="#small-dialog5" class="play-icon popup-with-zoom-anim f-history f-help">帮助</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- //底部 -->
    </div>
    <div class="clearfix"> </div>

    <div class="drop-menu">
    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu4">
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Regular link</a></li>
        <li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" href="#">Disabled link</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another link</a></li>
    </ul>
</div>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
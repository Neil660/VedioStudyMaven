<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="log.vo.*" %>
<%@ page import="log.dao.*" %>
<%@ page import="log.factory.DaoFactory" %>
<%@ page import="log.dao.HistoryDao" %>
<html>
<head>
    <title>完成的课程</title>
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

<%
    HistoryDao historyDAO = DaoFactory.getHistoryDaoInstance();
    int id;
    try {
        id = (int) session.getAttribute("id");
    }catch (NullPointerException e){
        id = 0;
    }
%>
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
                <form  method="get" class="navbar-form navbar-right" action="../searchServlet">
                    <input type="text" class="form-control" placeholder="搜索..." name="vname">
                    <input type="submit" value=" ">
                </form>
            </div>
            <div class="header-top-right">
                <%
                    if(id == 1){
                %>
                <!--上传-->
                <div class="file">
                    <a href="log/upload.jsp">上传</a>
                </div>
                <%
                    }
                    if(id > 0){
                %>
                <!--注销-->
                <div class="signin">
                    <a href="../quitServlet" class="play-icon popup-with-zoom-anim">注销</a>
                </div>
                <%
                    }
                %>
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
            <li><a href="index.jsp" class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
            <li><a href="shows.jsp" class="user-icon"><span class="glyphicon glyphicon-home glyphicon-blackboard" aria-hidden="true"></span>视频学习课程</a></li>
            <li><a href="history.jsp" class="sub-icon"><span class="glyphicon glyphicon-home glyphicon-hourglass" aria-hidden="true"></span>待学课程</a></li>
            <li class="active"><a class="sub-icon"><span class="glyphicon glyphicon-home glyphicon-hourglass" aria-hidden="true"></span>完成的课程</a></li>
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
        <div class="recommended">
            <div class="recommended-grids english-grid">
                <div class="recommended-info">
                    <div class="heading">
                        <h3>已完成的课程</h3>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <%
                    List<Recode> rel = null;
                    rel = historyDAO.findHisoryFinishedByUid(id);
                    if(rel.isEmpty()){
                %>
                <p>无完成的课程</p>
                <%
                } else{
                    for(Recode recode:rel){
                %>
                <div class="col-md-2 resent-grid recommended-grid sports-recommended-grid">
                    <div class="resent-grid-img recommended-grid-img">
                        <a href="../SingleServlet?vedioID=<%=recode.getVedioID() %>"><img src="../<%=recode.getUrl()%>.png" alt="" /></a>
                        <div class="time small-time sports-tome">
                            <p>已完成</p>
                        </div>
                    </div>
                    <div class="resent-grid-info recommended-grid-info">
                        <h5><a href="../SingleServlet?vedioID=<%=recode.getVedioID() %>" class="title"><%=recode.getTitle() %></a></h5>
                        <p class="author"><a href="#" class="author"><%=recode.getPublisher() %></a></p>
                        <p class="views"><%=recode.getCount() %> views</p>
                    </div>
                </div>
                <%
                        }
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
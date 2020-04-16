<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <%
        IndexDao indexDAO = DaoFactory.getIndexDaoInstance();
        UserDao userDao = DaoFactory.getUserDaoInstance();
        User user = new User();
        int id;
        try {
            id = (int) session.getAttribute("id");
            user = userDao.getUserById(id);
            session.setAttribute("user", user);
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
              <a class="navbar-brand" href="index.html"><h1><img src="images/logo.png" alt="" /></h1></a>
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
                  <div class="signin">
                      <a href="#small-dialog2" class="play-icon popup-with-zoom-anim">上传</a>
                      <!-- pop-up-box -->
                      <script type="text/javascript" src="js/modernizr.custom.min.js"></script>
                      <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
                      <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
                      <!--//pop-up-box -->
                      <div id="small-dialog2" class="mfp-hide">
                          <h3>上传视频</h3>
                          <div class="social-sits">
                              <h4>公告</h4>
                              <div class="button-bottom">
                                  <p>一个视频在数据库中有9个属性，包括视频id、视频标题vedioTitle、视频本地地址URL、发布者publisher、
                                      发表时间release、观看次数count、视频时长time、视频类别category和视频介绍introduce。</p><br/>
                                  <p>其中视频id会由数据库自增自动生成；本地地址有一套标准命名，路径为'vedio/类别_第几个视频'，均为小写，
                                      由后台管理者自动生成；发表时间由系统根据当下时间生成；观看次数初始化为0</p>
                                  <p>支持上传的视频格式有.avi、.rm、.rmvb、.wmv、.3gp、.mov、.flv、.ogg，其他格式暂不支持。</p>
                              </div>
                          </div>
                          <div class="signup">
                              <form method="post" action="../uploadServlet" enctype="multipart/form-data">
                                  <label>视频标签</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                  <input type="radio" name="category" value="java"/>&nbsp;JAVA&nbsp;&nbsp;<input type="radio" name="category" value="c"/>&nbsp;C/C++&nbsp;&nbsp;<input type="radio" name="category" value="python"/>&nbsp;Python&nbsp;&nbsp;<br/>
                                  <label>视频标题</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="vedioTitle" /><br/>
                                  <label>视频来源</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="publisher" placeholder="视频发布者名称"/><br/>
                                  <label>视频时长</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="time" placeholder="格式如'00:00:00'，时分秒"/><br/>
                                  <label>视频介绍</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="introduce" /><br/>
                                  <label>视频积分</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="integral" placeholder="建议在1到30之间"/><br/>
                                  <label>视频文件</label><input type="file" name="url" /><br/>
                                  <label></label><input type="submit" value="上传" />
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
                          //在刷新或关闭时调用的事件
                          /*$(window).bind('beforeunload',function(){
                              $.ajax({
                                  url:"${ctx}/system/user/user!logout.action",
                                  type:"post",
                                  success:function(){
                                      alert("您已退出登录");
                                  }
                              });
                          );*/
                      </script>
                  </div>
                  <%
                      }
                  %>
                  <!--注销-->
                  <div class="signin">
                      <a href="../quitServlet" class="play-icon popup-with-zoom-anim">注销</a>
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
                      <%
                          if(id > 0 && id != 1){
                      %>
                      <li><a href="history.jsp" class="sub-icon"><span class="glyphicon glyphicon-home glyphicon-hourglass" aria-hidden="true"></span>待学课程</a></li>
                      <li><a href="historyfinish.jsp" class="sub-icon"><span class="glyphicon glyphicon-home glyphicon-hourglass" aria-hidden="true"></span>完成的课程</a></li>
                      <%
                          }
                      %>
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
                <%-- 最近观看/设置超时提醒 --%>
				<div class="top-grids">
					<div class="recommended-info">
                    <%
                        if(id == 1){
                    %>
                        <h3>设置超时提醒</h3>
                    </div>
                    <form id="form1">
                        <p>超时提醒时间（单位：毫秒）<input name="timer" type="text" id="timer" tabindex="1"
                                               size="15" value="" placeholder="输入的数值要大于100" /></p>
                        <p><input type="button" value="点击设置定时器" onclick="setTimer()">
                    </form>
                    <script type="text/javascript">
                        /*var timeNum = <%--<%=timeNum%>--%>;
                        $(function(){
                            if (timeNum > 100) {
                                setInterval(function totaladd(){
                                    alert("定时器触发，每隔" + timeNum/60000 + "分提醒一次");
                                },timeNum);//设置定时1000=1秒
                            }
                        });*/
                        function setTimer() {
                            var timer = $('#timer').val();
                            var url = "/VedioStudyMaven_war_exploded";
                            $.ajax({
                                type : "POST",
                                dataType : "JSON",
                                url : url + "/timeoutReminderServlet",
                                data : {
                                    timer:timer
                                },
                                success : function(result) {
                                    console.log(result);
                                    timeNum = result;
                                    alert("定时器设置成功，用户将每隔" + result/60000 + "分钟提醒一次");
                                    ;
                                }
                            });
                        }
                    </script>
                    <div class="clearfix"> </div>
                </div>
                        <%
                            } else{
                        %>
                    <h1>欢迎您，<%=user.getUserName()%>!您目前的学习积分一共是：<%=user.getVedioIntegral()%></h1>
                    <br>
                    <hr/>
                    <br>
                    <h3>在学习的课程</h3>
					</div>
                    <%
                        List<Recode> recenList = null;
                        recenList = indexDAO.findRecentlyVedioByUid(id);
                        if(recenList.isEmpty()){    //如果无观看历史
                    %>
                    <p>无在学习的课程</p>
                    <%
                        }else{  //有观看历史
                            int[] imaxgroud = indexDAO.findLastestRecode(recenList);
                            List<Recode> rl = indexDAO.findRecodeByRids(imaxgroud);
                            for(Recode recode:rl){
                    %>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="../SingleServlet?vedioID=<%=recode.getVedioID() %>"><img src="../<%=recode.getUrl()%>.png" alt="" /></a>
							<div class="time">
								<p><%=recode.getDate() %></p>
							</div>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="../SingleServlet?vedioID=<%=recode.getVedioID() %>" class="title title-info"><%=recode.getTitle() %></a></h3>
							<ul>
								<li><p class="author author-info"><a href="" class="author"><%=recode.getPublisher() %></a></p></li>
								<li class="right-list"><p class="views views-info"><%=recode.getCount() %> views</p></li>
							</ul>
						</div>
					</div>
                    <%
                            }
                        }
                    %>
					<div class="clearfix"> </div>
				</div>
                    <%
                        }
                    %>
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
                                            List<Vedio> vedioJavaList = null;
                                            vedioJavaList = indexDAO.findVedioByCate("JAVA");
                                            int i = 0;
                                            for(Vedio vedio:vedioJavaList){
                                        %>
										<div class="col-md-3 resent-grid recommended-grid slider-first">
											<div class="resent-grid-img recommended-grid-img">
												<a href="../SingleServlet?vedioID=<%=vedio.getId() %>"><img src="../<%=vedio.getUrl()%>.png" alt="" /></a>
												<div class="time small-time slider-time">
													<p><%=vedio.getTime() %></p>
												</div>
											</div>
											<div class="resent-grid-info recommended-grid-info">
												<h5><a href="../SingleServlet?vedioID=<%=vedio.getId() %>" class="title"><%=vedio.getVedioTitle() %></a></h5>
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
								<a href="../SingleServlet?vedioID=<%=vedio.getId() %>"><img src="../<%=vedio.getUrl()%>.png" alt="" /></a>
								<div class="time small-time">
									<p><%=vedio.getTime() %></p>
								</div>

							</div>
							<div class="resent-grid-info recommended-grid-info video-info-grid">
								<h5><a href="../SingleServlet?vedioID=<%=vedio.getId() %>" class="title"><%=vedio.getVedioTitle() %></a></h5>
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
								<a href="../SingleServlet?vedioID=<%=vedio.getId() %>"><img src="../<%=vedio.getUrl()%>.png" alt="" /></a>
								<div class="time small-time">
									<p><%=vedio.getTime() %></p>
								</div>

							</div>
							<div class="resent-grid-info recommended-grid-info video-info-grid">
								<h5><a href="../SingleServlet?vedioID=<%=vedio.getId() %>" class="title"><%=vedio.getVedioTitle() %></a></h5>
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
							<li><a href="history.jsp" class="f-history">待学课程</a></li>
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
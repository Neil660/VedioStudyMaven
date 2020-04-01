<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="log.vo.*" %>
<%@ page import="log.dao.*" %>
<%@ page import="log.factory.DaoFactory" %>
<html>
<head>
<title>上传</title>
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
                      <a href="#small-dialog2" class="play-icon popup-with-zoom-anim">上传</a>
                      <!-- pop-up-box -->
                      <script type="text/javascript" src="js/modernizr.custom.min.js"></script>
                      <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
                      <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
                      <!--//pop-up-box -->
                      <div id="small-dialog2" class="mfp-hide">
                          <h3>上传视频</h3>
                          <div class="social-sits">
                              <h5>公告</h5>
                              <div class="button-bottom">
                                  <p>一个视频在数据库中有9个属性，包括视频id、视频标题vedioTitle、视频本地地址URL、发布者publisher、
                                      发表时间release、观看次数count、视频时长time、视频类别category和视频介绍introduce。</p><br/>
                                  <p>其中视频id会由数据库自增自动生成；本地地址有一套标准命名，路径为'vedio/类别_第几个视频'，
                                      由后台管理者自动生成；发表时间由系统根据当下时间生成；观看次数初始化为0</p>
                              </div>
                          </div>
                          <div class="signup">
                              <form methon="POST" action="../uploadServlet" >
                                  <input type="file" name="vfile" /><br/>
                                  <input type="file" name="pfile" /><br/>
                                  <label>上传</label><input type="submit" value="上传" />
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
                  <div class="clearfix"> </div>
              </div>
          </div>
          <div class="clearfix"> </div>
      </div>
  </nav>


		<!-- upload -->
		<div class="upload">
			<!-- container -->
			<div class="container">
				<div class="upload-grids">
					<div class="upload-right">
						<div class="upload-file">
							<div class="services-icon">
								<span class="glyphicon glyphicon-open" aria-hidden="true"></span>
							</div>
							<input type="file" value="Choose file..">
						</div>
						<div class="upload-info">
							<h5>Select files to upload</h5>
							<span>or</span>
							<p>Drag and drop files</p>
						</div>
					</div>
					<div class="upload-right-bottom-grids">
						<div class="col-md-4 upload-right-bottom-left">
							<h4>Help and Suggestions</h4>
							<div class="upload-right-top-list">
								<ul>
									<li><a href="#">Lorem ipsum dolor sit amet</a></li>
									<li><a href="#">Fusce egestas tincidunt massa</a></li>
									<li><a href="#">Pellentesque vehicula quis tellus</a></li>
									<li><a href="#">Etiam gravida feugiat tortor eget eleifend</a></li>
									<li><a href="#">Etiam iaculis facilisis metus a viverra</a></li>
									<li><a href="#">Fusce sed enim non orci molestie</a></li>
									<li><a href="#">Lorem ipsum dolor sit amet</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-4 upload-right-bottom-left">
							<h4>Import videos</h4>
							<div class="upload-right-top-list">
								<ul>
									<li><a href="#">Lorem ipsum dolor sit amet</a></li>
									<li><a href="#">Fusce egestas tincidunt massa</a></li>
									<li><a href="#">Pellentesque vehicula quis tellus</a></li>
									<li><a href="#">Etiam gravida feugiat tortor eget eleifend</a></li>
									<li><a href="#">Etiam iaculis facilisis metus a viverra</a></li>
									<li><a href="#">Fusce sed enim non orci molestie</a></li>
									<li><a href="#">Lorem ipsum dolor sit amet</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-4 upload-right-bottom-left">
							<h4>Live streaming</h4>
							<div class="upload-right-top-list">
								<ul>
									<li><a href="#">Lorem ipsum dolor sit amet</a></li>
									<li><a href="#">Fusce egestas tincidunt massa</a></li>
									<li><a href="#">Pellentesque vehicula quis tellus</a></li>
									<li><a href="#">Etiam gravida feugiat tortor eget eleifend</a></li>
									<li><a href="#">Etiam iaculis facilisis metus a viverra</a></li>
									<li><a href="#">Fusce sed enim non orci molestie</a></li>
									<li><a href="#">Lorem ipsum dolor sit amet</a></li>
								</ul>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
			<!-- //container -->
		</div>
		<!-- //upload -->
			<!-- footer -->
			<div class="footer">
				<div class="container">
					<div class="footer-top">
						<div class="footer-top-nav">
							<ul>
								<li><a href="about.jsp">About</a></li>
								<li><a href="press.jsp">Press</a></li>
								<li><a href="copyright.jsp">Copyright</a></li>
								<li><a href="creators.jsp">Creators</a></li>
								<li><a href="#">Advertise</a></li>
								<li><a href="developers.jsp">Developers</a></li>
							</ul>
						</div>
						<div class="footer-bottom-nav">
							<ul>
								<li><a href="terms.jsp">Terms</a></li>
								<li><a href="privacy.jsp">Privacy</a></li>
								<li><a href="#small-dialog4" class="play-icon popup-with-zoom-anim">Send feedback</a></li>
								<li><a href="privacy.jsp">Policy & Safety </a></li>
								<li><a href="try.jsp">Try something new!</a></li>
								<li><p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p></li>
							</ul>
						</div>
					</div>
					<div class="footer-bottom">
						<ul>
							<li class="languages">
								<select class="form-control bfh-countries" data-country="US">
									<option value="">Select Language</option>
									<option>Spanish</option>
									<option>French</option>
									<option>German</option>
									<option>Italian</option>
									<option>Chinese</option>
									<option>Tagalog</option>
									<option>Polish</option>
									<option>Korean</option>
									<option>Vietnamese</option>
									<option>Portuguese</option>
									<option>Japanese</option>
									<option>Greek</option>
									<option>Arabic</option>
									<option>Hindi (urdu)</option>
									<option>Russian</option>
									<option>Yiddish</option>
									<option>Thai (laotian)</option>
									<option>Persian</option>
									<option>French Creole</option>
									<option>Armenian</option>
									<option>Navaho</option>
									<option>Hungarian</option>
									<option>Hebrew</option>
									<option>Dutch</option>
									<option>Mon-khmer (cambodian)</option>
									<option>Gujarathi</option>
									<option>Ukrainian</option>
									<option>Czech</option>
									<option>Pennsylvania Dutch</option>
									<option>Miao (hmong)</option>
									<option>Norwegian</option>
									<option>Slovak</option>
									<option>Swedish</option>
									<option>Serbocroatian</option>
									<option>Kru</option>
									<option>Rumanian</option>
									<option>Lithuanian</option>
									<option>Finnish</option>
									<option>Panjabi</option>
									<option>Formosan</option>
									<option>Croatian</option>
									<option>Turkish</option>
									<option>Ilocano</option>
									<option>Bengali</option>
									<option>Danish</option>
									<option>Syriac</option>
									<option>Samoan</option>
									<option>Malayalam</option>
									<option>Cajun</option>
									<option>Amharic</option>
								</select>
							</li>
							<li class="languages">
								<select class="form-control bfh-countries">
									<option value="">Select Country</option>
									<option value="AFG">Afghanistan</option>
									<option value="ALA">Åland Islands</option>
									<option value="ALB">Albania</option>
									<option value="DZA">Algeria</option>
									<option value="ASM">American Samoa</option>
									<option value="AND">Andorra</option>
									<option value="AGO">Angola</option>
									<option value="AIA">Anguilla</option>
									<option value="ATA">Antarctica</option>
									<option value="ATG">Antigua and Barbuda</option>
									<option value="ARG">Argentina</option>
									<option value="ARM">Armenia</option>
									<option value="ABW">Aruba</option>
									<option value="AUS">Australia</option>
									<option value="AUT">Austria</option>
									<option value="AZE">Azerbaijan</option>
									<option value="BHS">Bahamas</option>
									<option value="BHR">Bahrain</option>
									<option value="BGD">Bangladesh</option>
									<option value="BRB">Barbados</option>
									<option value="BLR">Belarus</option>
									<option value="BEL">Belgium</option>
									<option value="BLZ">Belize</option>
									<option value="BEN">Benin</option>
									<option value="BMU">Bermuda</option>
									<option value="BTN">Bhutan</option>
									<option value="BOL">Bolivia, Plurinational State of</option>
									<option value="BES">Bonaire, Sint Eustatius and Saba</option>
									<option value="BIH">Bosnia and Herzegovina</option>
									<option value="BWA">Botswana</option>
									<option value="BVT">Bouvet Island</option>
									<option value="BRA">Brazil</option>
									<option value="IOT">British Indian Ocean Territory</option>
									<option value="BRN">Brunei Darussalam</option>
									<option value="BGR">Bulgaria</option>
									<option value="BFA">Burkina Faso</option>
									<option value="BDI">Burundi</option>
									<option value="KHM">Cambodia</option>
									<option value="CMR">Cameroon</option>
									<option value="CAN">Canada</option>
									<option value="CPV">Cape Verde</option>
									<option value="CYM">Cayman Islands</option>
									<option value="CAF">Central African Republic</option>
									<option value="TCD">Chad</option>
									<option value="CHL">Chile</option>
									<option value="CHN">China</option>
									<option value="CXR">Christmas Island</option>
									<option value="CCK">Cocos (Keeling) Islands</option>
									<option value="COL">Colombia</option>
									<option value="COM">Comoros</option>
									<option value="COG">Congo</option>
									<option value="COD">Congo, the Democratic Republic of the</option>
									<option value="COK">Cook Islands</option>
									<option value="CRI">Costa Rica</option>
									<option value="CIV">Côte d'Ivoire</option>
									<option value="HRV">Croatia</option>
									<option value="CUB">Cuba</option>
									<option value="CUW">Curaçao</option>
									<option value="CYP">Cyprus</option>
									<option value="CZE">Czech Republic</option>
									<option value="DNK">Denmark</option>
									<option value="DJI">Djibouti</option>
									<option value="DMA">Dominica</option>
									<option value="DOM">Dominican Republic</option>
									<option value="ECU">Ecuador</option>
									<option value="EGY">Egypt</option>
									<option value="SLV">El Salvador</option>
									<option value="GNQ">Equatorial Guinea</option>
									<option value="ERI">Eritrea</option>
									<option value="EST">Estonia</option>
									<option value="ETH">Ethiopia</option>
									<option value="FLK">Falkland Islands (Malvinas)</option>
									<option value="FRO">Faroe Islands</option>
									<option value="FJI">Fiji</option>
									<option value="FIN">Finland</option>
									<option value="FRA">France</option>
									<option value="GUF">French Guiana</option>
									<option value="PYF">French Polynesia</option>
									<option value="ATF">French Southern Territories</option>
									<option value="GAB">Gabon</option>
									<option value="GMB">Gambia</option>
									<option value="GEO">Georgia</option>
									<option value="DEU">Germany</option>
									<option value="GHA">Ghana</option>
									<option value="GIB">Gibraltar</option>
									<option value="GRC">Greece</option>
									<option value="GRL">Greenland</option>
									<option value="GRD">Grenada</option>
									<option value="GLP">Guadeloupe</option>
									<option value="GUM">Guam</option>
									<option value="GTM">Guatemala</option>
									<option value="GGY">Guernsey</option>
									<option value="GIN">Guinea</option>
									<option value="GNB">Guinea-Bissau</option>
									<option value="GUY">Guyana</option>
									<option value="HTI">Haiti</option>
									<option value="HMD">Heard Island and McDonald Islands</option>
									<option value="VAT">Holy See (Vatican City State)</option>
									<option value="HND">Honduras</option>
									<option value="HKG">Hong Kong</option>
									<option value="HUN">Hungary</option>
									<option value="ISL">Iceland</option>
									<option value="IND">India</option>
									<option value="IDN">Indonesia</option>
									<option value="IRN">Iran, Islamic Republic of</option>
									<option value="IRQ">Iraq</option>
									<option value="IRL">Ireland</option>
									<option value="IMN">Isle of Man</option>
									<option value="ISR">Israel</option>
									<option value="ITA">Italy</option>
									<option value="JAM">Jamaica</option>
									<option value="JPN">Japan</option>
									<option value="JEY">Jersey</option>
									<option value="JOR">Jordan</option>
									<option value="KAZ">Kazakhstan</option>
									<option value="KEN">Kenya</option>
									<option value="KIR">Kiribati</option>
									<option value="PRK">Korea, Democratic People's Republic of</option>
									<option value="KOR">Korea, Republic of</option>
									<option value="KWT">Kuwait</option>
									<option value="KGZ">Kyrgyzstan</option>
									<option value="LAO">Lao People's Democratic Republic</option>
									<option value="LVA">Latvia</option>
									<option value="LBN">Lebanon</option>
									<option value="LSO">Lesotho</option>
									<option value="LBR">Liberia</option>
									<option value="LBY">Libya</option>
									<option value="LIE">Liechtenstein</option>
									<option value="LTU">Lithuania</option>
									<option value="LUX">Luxembourg</option>
									<option value="MAC">Macao</option>
									<option value="MKD">Macedonia, the former Yugoslav Republic of</option>
									<option value="MDG">Madagascar</option>
									<option value="MWI">Malawi</option>
									<option value="MYS">Malaysia</option>
									<option value="MDV">Maldives</option>
									<option value="MLI">Mali</option>
									<option value="MLT">Malta</option>
									<option value="MHL">Marshall Islands</option>
									<option value="MTQ">Martinique</option>
									<option value="MRT">Mauritania</option>
									<option value="MUS">Mauritius</option>
									<option value="MYT">Mayotte</option>
									<option value="MEX">Mexico</option>
									<option value="FSM">Micronesia, Federated States of</option>
									<option value="MDA">Moldova, Republic of</option>
									<option value="MCO">Monaco</option>
									<option value="MNG">Mongolia</option>
									<option value="MNE">Montenegro</option>
									<option value="MSR">Montserrat</option>
									<option value="MAR">Morocco</option>
									<option value="MOZ">Mozambique</option>
									<option value="MMR">Myanmar</option>
									<option value="NAM">Namibia</option>
									<option value="NRU">Nauru</option>
									<option value="NPL">Nepal</option>
									<option value="NLD">Netherlands</option>
									<option value="NCL">New Caledonia</option>
									<option value="NZL">New Zealand</option>
									<option value="NIC">Nicaragua</option>
									<option value="NER">Niger</option>
									<option value="NGA">Nigeria</option>
									<option value="NIU">Niue</option>
									<option value="NFK">Norfolk Island</option>
									<option value="MNP">Northern Mariana Islands</option>
									<option value="NOR">Norway</option>
									<option value="OMN">Oman</option>
									<option value="PAK">Pakistan</option>
									<option value="PLW">Palau</option>
									<option value="PSE">Palestinian Territory, Occupied</option>
									<option value="PAN">Panama</option>
									<option value="PNG">Papua New Guinea</option>
									<option value="PRY">Paraguay</option>
									<option value="PER">Peru</option>
									<option value="PHL">Philippines</option>
									<option value="PCN">Pitcairn</option>
									<option value="POL">Poland</option>
									<option value="PRT">Portugal</option>
									<option value="PRI">Puerto Rico</option>
									<option value="QAT">Qatar</option>
									<option value="REU">Réunion</option>
									<option value="ROU">Romania</option>
									<option value="RUS">Russian Federation</option>
									<option value="RWA">Rwanda</option>
									<option value="BLM">Saint Barthélemy</option>
									<option value="SHN">Saint Helena, Ascension and Tristan da Cunha</option>
									<option value="KNA">Saint Kitts and Nevis</option>
									<option value="LCA">Saint Lucia</option>
									<option value="MAF">Saint Martin (French part)</option>
									<option value="SPM">Saint Pierre and Miquelon</option>
									<option value="VCT">Saint Vincent and the Grenadines</option>
									<option value="WSM">Samoa</option>
									<option value="SMR">San Marino</option>
									<option value="STP">Sao Tome and Principe</option>
									<option value="SAU">Saudi Arabia</option>
									<option value="SEN">Senegal</option>
									<option value="SRB">Serbia</option>
									<option value="SYC">Seychelles</option>
									<option value="SLE">Sierra Leone</option>
									<option value="SGP">Singapore</option>
									<option value="SXM">Sint Maarten (Dutch part)</option>
									<option value="SVK">Slovakia</option>
									<option value="SVN">Slovenia</option>
									<option value="SLB">Solomon Islands</option>
									<option value="SOM">Somalia</option>
									<option value="ZAF">South Africa</option>
									<option value="SGS">South Georgia and the South Sandwich Islands</option>
									<option value="SSD">South Sudan</option>
									<option value="ESP">Spain</option>
									<option value="LKA">Sri Lanka</option>
									<option value="SDN">Sudan</option>
									<option value="SUR">Suriname</option>
									<option value="SJM">Svalbard and Jan Mayen</option>
									<option value="SWZ">Swaziland</option>
									<option value="SWE">Sweden</option>
									<option value="CHE">Switzerland</option>
									<option value="SYR">Syrian Arab Republic</option>
									<option value="TWN">Taiwan, Province of China</option>
									<option value="TJK">Tajikistan</option>
									<option value="TZA">Tanzania, United Republic of</option>
									<option value="THA">Thailand</option>
									<option value="TLS">Timor-Leste</option>
									<option value="TGO">Togo</option>
									<option value="TKL">Tokelau</option>
									<option value="TON">Tonga</option>
									<option value="TTO">Trinidad and Tobago</option>
									<option value="TUN">Tunisia</option>
									<option value="TUR">Turkey</option>
									<option value="TKM">Turkmenistan</option>
									<option value="TCA">Turks and Caicos Islands</option>
									<option value="TUV">Tuvalu</option>
									<option value="UGA">Uganda</option>
									<option value="UKR">Ukraine</option>
									<option value="ARE">United Arab Emirates</option>
									<option value="GBR">United Kingdom</option>
									<option value="USA">United States</option>
									<option value="UMI">United States Minor Outlying Islands</option>
									<option value="URY">Uruguay</option>
									<option value="UZB">Uzbekistan</option>
									<option value="VUT">Vanuatu</option>
									<option value="VEN">Venezuela, Bolivarian Republic of</option>
									<option value="VNM">Viet Nam</option>
									<option value="VGB">Virgin Islands, British</option>
									<option value="VIR">Virgin Islands, U.S.</option>
									<option value="WLF">Wallis and Futuna</option>
									<option value="ESH">Western Sahara</option>
									<option value="YEM">Yemen</option>
									<option value="ZMB">Zambia</option>
									<option value="ZWE">Zimbabwe</option>
								</select>
							</li>
							<li class="languages">
								<select class="form-control bfh-countries" data-country="US">
									<option value="">Safety Off</option>
									<option value="">Safety On</option>
								</select>
							</li>
							<li><a href="history.jsp" class="f-history">History</a></li>
							<li><a href="#small-dialog5" class="play-icon popup-with-zoom-anim f-history f-help">Help</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- //footer -->
		<div class="clearfix"> </div>
	<div class="drop-menu">
		<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu4">
		  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Regular link</a></li>
		  <li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" href="#">Disabled link</a></li>
		  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another link</a></li>
		</ul>
	</div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
  </body>
</html>
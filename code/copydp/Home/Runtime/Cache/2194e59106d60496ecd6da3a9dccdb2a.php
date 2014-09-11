<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<link rel="dns-prefetch" href="http://t1.dpfile.com" />
<link rel="dns-prefetch" href="http://t2.dpfile.com" />
<link rel="dns-prefetch" href="http://t3.dpfile.com" />
<link rel="dns-prefetch" href="http://si1.s1.dpfile.com/" />
<!---标题---->
	<title>团购网站</title>
<!---标题---->

<link rel="Shortcut Icon" href="http://t3.s2.dpfile.com/t/res/favicon.5ff777c11d7833e57e01c9d192b7e427.ico" type="image/x-icon" />
<link rel="stylesheet" href="http://t3.s2.dpfile.com/t/cssnew/newhome/index.min.f0d842c5a6164286508bc847f37723b1.css" type="text/css" />
<link rel="stylesheet" href="http://t3.s2.dpfile.com/t/cssnew/account/login.min.87f3f79a1a6d4db0517fcf5c3eb42178.css" type="text/css"/>
<link rel="stylesheet" src="css/fg.css" type="text/css" />
</head>
<body>
	<!---标题栏---->
		<div class="head-bar responsive">
		<div class="cont">
			<ul class="nav nav-left">
				<li class="has-line"><a href="__APP__/Index/login"> <span>用户登陆</span> </a> </li>
				<li class="logo-browser-fav J_browser_fav"> <a href="__APP__/Index/register"> <span>免费注册</span> </a> </li>
			</ul>
			<ul class="nav">
				<!-- active-dropdown -->
				<li class="has-line"> <a href="__APP__/Admin/userinfo" class=""><span>会员中心</span></a> </li>
				<li class="has-line"> <a href="__APP__/Admin/sellesInfo" class=""><span>商家中心</span></a> </li>
				<li class="has-line"> <a target="_blank" class=""><span>后台管理</span></a> </li>
			</ul>
		</div>
	</div>	
	<!---标题栏---->
	
	<div class="head responsive">
		<!---Logo栏---->
					<div class="head-qmenu head-qmenu-new cont Fix">
			<div class="logo Fix">
				<img src="__PUBLIC__/img/logo.jpg" style="top: 5px;">
			</div>
			<div class="guides">
				<h2 class="Fix switch-wrap"> <a class="switch J_city_switch" href="javascript:;"> <span class="current J_currentcityname">城市</span> </a> <a  href="__URL__/city" class="switch-city">[切换城市]</a> </h2>
			</div>
			<div class="search-div search-div-new" data-jump="" data-promo-text="#买团购见叫兽#">
				<input type="text" autocomplete="off" name="search" class="input focus" placeholder="请输入店名、商品名称、商区等" id="search-keywords" value="" >
				<a class="search-btn" id="searchBtn" track="dp_tg_dongguan_search">搜索</a>
			</div>
		</div>
		<!---Logo栏---->
		
		<div class="nav-bar">
			<div class="cont">				
				<!-----主菜单---->
					<ul class="nav">
	<li class="current"> <a  href="__APP__/Index/index"> <span> 网站首页 </span> </a> </li>
	<li> <a  href="__APP__/Buy/product_list"> <span> 今日特惠 </span> </a> </li>
	<li> <a  href="__APP__/Seller/seller"> <span> 联盟商户 </span> </a> </li>
	<li> <a  href="__APP__/Seller/recommend_seller"> <span> 商家推荐 </span> </a> </li>
	<li> <a  href="__APP__/Community/community"> <span> 社区 </span> </a> </li>
	<li> <a  href="__APP__/Activity/activity"> <span> 活动 </span> </a> </li>
</ul>
				<!-----主菜单---->
			</div>
		</div>
	</div>
	
	<!---登陆栏---->
	<div class="pgm">
		<div class="main_w">
			<div class="page-sa box Form-box">
				<div class="box-t">
					<span class="box-tl"></span> <span class="box-tm"></span> <span class="box-tr"></span>
				</div>
				<div class="box-wrap">
					<div class="box-cont box-cont-new">
						<div class="login-cont J_cont">
							<div class="reg-switch J_switch">
								<span class="switch-bg1 J_switch_tab reg-switch-sel">会员登录</span>
							</div>
							<div class="reg-switch-box J_switch_box ">
								<div class="J_login Fix">
									<form action="" method="post" id="regForm2">
										<ul class="login-new-ul">
											<li><span class="ws">邮箱</span>
												<input onclick="_hip.push(['mv', {module: '5_emailreg_email', action: 'click'}])" name="email" class="text foc J_reg_email_add" type="text" id="email" tabindex="1" autocomplete="off"  />
												<span class="input-error J_err Hide"></span> <span class="prompt J_prmt Hide"></span> </li>
											<li><span class="ws">设置密码</span>
												<input onclick="_hip.push(['mv', {module: '5_emailreg_password', action: 'click'}])" name="password" class="text foc J_reg_email_pwd" type="password" id="email-password" tabindex="2" autocomplete="off" />
												<span class="input-error J_err Hide"></span> <span class="prompt J_prmt Hide">长度为6到32个字符</span> </li>
											<li><span class="ws">验证码</span>
												<input onclick="_hip.push(['mv', {module: '5_emailreg_verify', action: 'click'}])" name="validate" class="text validate foc J_reg_email_captcha" type="text" id="email-validate" tabindex="3" autocomplete="off" />
												<img id="mcImgVC2" onclick="this.src='/account/treg.jpg?xx=' + Math.floor(Math.random()*1001);" src='/account/treg.jpg?xx=888'> <a href="#" onclick="document.getElementById('mcImgVC2').src='/account/treg.jpg?xx=?'+ Math.floor(Math.random()*1001);return false;">换一个</a> <span class="input-error J_err Hide"></span> <span class="prompt J_prmt Hide"></span> </li>
											<li class="J_general_err Hide"> <span class="ws">&nbsp;</span> <span class="J_err input-error Hide"></span> <span class="prompt J_prmt Hide"></span> </li>
											<li class="J_action"><span class="ws">&nbsp;</span>
												<div class="reg-btn-new">
													<a href="#" track="|1|module#5_emailreg_button,action#click" class="b-rbtn mob-login J_user_reg_email"> <span>同意用户协议，注册</span> </a>
												</div>
											</li>
											<li> <span class="ws">&nbsp;</span><a class="aggrement" href="/useragreement">《点评团用户协议》</a> </li>
										</ul>
									</form>
								</div>
							</div>
						</div>
						<div class="aside-right-new">
							<span>没有XXX团帐号？</span> <a track="|1|module#5_lg_mobreg,action#click" class="aside-right-buy-btn m-lbtn" href="/register"><span>快速注册</span></a>
							<!----
							<span class="login">合作网站账号登录</span>
								<ul>
									
								</ul>
							</div>
							------>
						</div>
					</div>
				</div>
				<div class="box-b">
					<span class="box-bl"></span> <span class="box-bm"></span> <span class="box-br"></span>
				</div>
			</div>
		</div>
	</div>
	<!---footer-->
	<div class="t-footer">
		<div class="foot-inner">
			<div class="Fix">
				<ul class="contact">
					<li>
						<h3>友情链接</h3>
						<ul>
							<li>·<a>友情链接1</a></li>
							<li>·<a>友情链接2</a></li>
							<li>·<a>友情链接3</a></li>
							<li>·<a>友情链接4</a></li>
						</ul>
					</li>
					<li>
						<h3>服务帮助</h3>
						<ul>
							<li>·<a>服务帮助1</a></li>
							<li>·<a>服务帮助2</a></li>
							<li>·<a>服务帮助3</a></li>
						</ul>
					</li>
					<li>
						<h3>用户指南</h3>
						<ul>
							<li>·<a>用户指南1</a></li>
							<li>·<a>用户指南2</a></li>
							<li>·<a>用户指南3</a></li>
							<li>·<a>用户指南4</a></li>
						</ul>
					</li>
					<li class="nobrd">
						<h3>联系我们</h3>
						<ul>
							<li>·<a >在线客服»</a></li>
							<li>·<span class="mg">000-000-1234(8:00-21:00)</span></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!---footer-->
</body>
</html>
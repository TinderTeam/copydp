<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<link rel="dns-prefetch" href="http://t1.dpfile.com" />
<link rel="dns-prefetch" href="http://t2.dpfile.com" />
<link rel="dns-prefetch" href="http://t3.dpfile.com" />
<link rel="dns-prefetch" href="http://si1.s1.dpfile.com/" />
<title>团购网站</title>
<link type="text/css" href="http://t3.s2.dpfile.com/t/cssnew/my/index.min.81e8e568c7d3705cb3d1ecc2cf472b7d.css" rel="stylesheet"/>
<link rel="stylesheet" href="http://t2.s2.dpfile.com/t/cssnew/my/rate-pop.min.5ec84ae0b63499fec0e87d82923458a0.css"" type="text/css" />
</head>
<body id="body" data-type="">
	<!---标题栏---->
	<div class="head-bar responsive">
		<div class="cont">
			<ul class="nav nav-left">
				<li class="has-line"><a href="login.html"> <span>用户登陆</span> </a> </li>
				<li class="logo-browser-fav J_browser_fav"> <a href="register.html"> <span>免费注册</span> </a> </li>
			</ul>
			<ul class="nav">
				<!-- active-dropdown -->
				<li class="has-line"> <a target="_blank" class=""><span>会员中心</span></a> </li>
				<li class="has-line"> <a target="_blank" class=""><span>商家中心</span></a> </li>
				<li class="has-line"> <a target="_blank" class=""><span>后台管理</span></a> </li>
			</ul>
		</div>
	</div>
	<!---标题栏---->
	<!---标题栏---->
	<div class="head responsive">
		<div class="head-qmenu head-qmenu-new cont Fix">
			<div class="logo Fix">
				<img src="img/logo.jpg" style="top: 5px;">
			</div>
			<div class="guides">
				<h2 class="Fix switch-wrap"> <a class="switch J_city_switch" href="javascript:;"> <span class="current J_currentcityname">城市</span> </a> <a class="switch-city">[切换城市]</a> </h2>
			</div>
			<div class="search-div search-div-new" data-jump="" data-promo-text="#买团购见叫兽#">
				<input type="text" autocomplete="off" name="search" class="input focus"
           placeholder="请输入店名、商品名称、商区等" id="search-keywords" value="" >
				<a class="search-btn" id="searchBtn" track="dp_tg_dongguan_search">搜索</a>
			</div>
		</div>
		<div class="nav-bar">
			<div class="cont">
								<!-----主菜单---->
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="user-nav J_user_nav">
			<ul>
				<li class="cur"> <a href="/account/usercenter">我的XX团</a> <i class="n-arr"></i> </li>
				<li > <a href="/account/coupons">我的订单</a> <i class="n-arr"></i>
					<ul>
						<li > <a href="/account/orders/0">团购订单</a> <i class="n-arr"></i> </li>
						<li > <a href="/account/orders/0">活动</a> <i class="n-arr"></i> </li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="user-main">
			<div class="um-hd">
				<div class="user-info pic-txt J_user_info">
					<div class="pic">
						<a track="|1|module#5_my_info,action#click,index#1,content#/account/settings" title="" href="/account/settings"><img class="" width="96" height="96" alt="" src="http://j1.s2.dpfile.com/s/img/uc/default-avatar120c120.v17.png"> </a>
					</div>
					<div class="txt">
						<div class="tit">
							<h2 class="name">测试用户</h2>
						</div>
						<p> <span>手机已绑定 186****2480 <a track="|1|module#5_my_info,action#click,index#2" class="alter J_rebind_mob" href="#">修改</a></span> </p>
						<p><span>余额：&#165;0</span> </p>
					</div>
				</div>
				<div class="misc">
					<div class="tips">
						<ul>
							<li><a track="|1|module#5_my_info,action#click,index#3,content#/account/coupons" href="/account/coupons"> <strong>1</strong>未使用</a></li>
							<li><a track="|1|module#5_my_info,action#click,index#5,content#/account/rates/2" href="/account/rates/2"> <strong>3</strong>待评价</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="um-con">
				<!--我的订单-->
				<div class="modebox my-booking J_my_booking">
					<div class="hd">
						<h4>我的订单</h4>
						<a href="/account/orders" class="more">查看全部&raquo;</a>
					</div>
					<div class="con">
						<div class="pic-list J_booking_list">
							<ul>
								<li>
									<div class="pic">
										<a title="" class="img"><img src="http://t2.s2.dpfile.com/pc/mc/9f6275722e101caab92553abb52c41a5(216c135)/thumb.jpg"></a>
									</div>
									<div class="txt">
										<p><a>中影星河电影城:电影票2选1</a></p>
										<p> <strong class="f-ok"> 未使用 </strong>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!--我的评价-->
				<div class="modebox my-comm J_my_comm" >
					<div class="hd">
						<h4>我的评价</h4>
						<span>这些团购等你来评价哦！</span> <a track="|1|module#5_my_rate,action#click,index#999,content#/account/rates"
          href="/account/rates" class="more">查看全部&raquo;</a>
					</div>
					<div class="con">
						<div class="comm-list J_comm_list">
							<ul>
								<div class="txt-wrap">
									<div class="txt">
										<h5><a target="_blank" href="/deal/73838">德客莱斯</a></h5>
										<p>仅售69.9元,价值127元双人套餐!西式休闲大餐,临窗看景慢品!秋日晴好,适合我们的美好约会!</p>
										<div class="slt-stars">
											<div class="stars-box J_stars_box">
												<div class="star-rating">
													<ul class="star-wrap">
														<li data-value="10" data-hint="很差" class="s1">1星</li>
														<li data-value="20" data-hint="差" class="s2">2星</li>
														<li data-value="30" data-hint="还行" class="s3">3星</li>
														<li data-value="40" data-hint="好" class="s4">4星</li>
														<li data-value="50" data-hint="很好" class="s5">5星</li>
													</ul>
												</div>
											</div>
											<div class="comm">
												<a href="#" class="J_stars_comm" data-lock="0">评价</a>
											</div>
										</div>
									</div>
								</div>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
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


<link rel="stylesheet" href="http://t2.s2.dpfile.com/t/cssnew/my/rate-pop.min.5ec84ae0b63499fec0e87d82923458a0.css" type="text/css" />
    <link type="text/css" href="http://t1.s2.dpfile.com/t/cssnew/my/order.min.5a7226cd2f3426def2f1ad35c9e6efa2.css" rel="stylesheet"/>
	<link rel="stylesheet" href="http://t3.s2.dpfile.com/t/cssnew/neworder/page/c.process.min.92c908b76c13b72d9517a6cd433cc597.css" type="text/css" />
<link rel="stylesheet" href="http://j1.s2.dpfile.com/s/c/app/main/base-old.min.97b2942750e98b1213fe2f167b08db28.css" type="text/css" />
<link rel="stylesheet" href="http://j2.s2.dpfile.com/s/c/app/shop/add.min.0fe62b4e4cc3553c338ed7e73a89c1e4.css" type="text/css" />

</head>
<body id="body" data-type="">
	<!---标题栏---->
		<div class="head-bar responsive">
		<div class="cont">
			<ul class="nav nav-left">
				<li class="has-line"><a href="__APP__/Index/login"> <span>用户登陆</span> </a> </li>
				<li class="logo-browser-fav J_browser_fav"> <a href="__APP__/Index/login"> <span>免费注册</span> </a> </li>
			</ul>
			<ul class="nav">
				<!-- active-dropdown -->
				<li class="has-line"> <a href="__APP__/Admin/userinfo" class=""><span>会员中心</span></a> </li>
				<li class="has-line"> <a href="__APP__/Admin/sellesInfo" class=""><span>商家中心</span></a> </li>
				<li class="has-line"> <a href="__ROOT__/Admin/Index/index" class=""><span>后台管理</span></a> </li>
			</ul>
		</div>
	</div>	
	<!---标题栏---->
	
	<div class="head responsive">
		<!---Logo栏---->
					<style type="text/css">
			.my-search-btn{
				float: left;
				font-weight: bolder;
				display: block;
				line-height: 38px;
				cursor: pointer;
				width: 100px;
				height: 32px;
				text-align: center;
				color: #fff;
				font-size: 14px;
				background-color: #ff8400;
				position: absolute;
				height: 38px;
				right: -101px;
				top: -3px;
				z-index: 200;
				border-radius: 0 3px 3px 0;
			}
			
			.head.responsive .cont .search-div-new {
				width: 457px!important;
				right: 128px;
				}
		</style>
		
		
		
		<div class="head-qmenu head-qmenu-new cont Fix">
			<div class="logo Fix">
				<img src="__PUBLIC__/img/logo.jpg" style="top: 5px;">
			</div>
			<div class="guides">
				<h2 class="Fix switch-wrap"> <a class="switch J_city_switch" href="javascript:;"> <span class="current J_currentcityname">城市</span> </a> <a  href="__APP__/Index/city" class="switch-city">[切换城市]</a> </h2>
			</div>
			<div class="search-div search-div-new" data-jump="" data-promo-text="#买团购见叫兽#">
				<input type="text" autocomplete="off" name="search" class="input focus" placeholder="请输入店名、商品名称、商区等" id="search-keywords" value="" >
				<a class="my-search-btn"  href="__APP__/Buy/product_list">搜索</a>
			</div>
		</div>
		<!---Logo栏---->
		
		<div class="nav-bar">
			<div class="cont">

				<!-----主菜单---->
					<ul class="nav">
	<li> <a  href="__APP__/Index/index"> <span> 网站首页 </span> </a> </li>
	<li> <a  href="__APP__/Buy/product_list"> <span> 天天特惠 </span> </a> </li>
	<li> <a  href="__APP__/Seller/seller"> <span> 联盟商户 </span> </a> </li>
	<li> <a  href="__APP__/Community/community"> <span> 社区 </span> </a> </li>
	<li> <a  href="__APP__/Activity/activity"> <span> 活动 </span> </a> </li>
</ul>
				<!-----主菜单---->
			</div>
		</div>
	</div>
	
	<!---主页面---->
	<div class="wrap">
		<!---左侧导航栏--->
		<div class="user-nav J_user_nav">
			<ul>
				<li class="cur"> <a href="/account/coupons">会员管理</a> <i class="n-arr"></i></li>
				<li > <a href="/account/coupons">商家管理</a> <i class="n-arr"></i></li>
				<li > <a href="/account/coupons">活动管理</a> <i class="n-arr"></i></li>
			</ul>
		</div><!---左侧导航栏--->
		<!---中间主要内容--->
		<div class="main_w Tabs-page user-main  page-account">	
			<div class="user-main">
				<!---产品信息编辑--->
				<div class="um-con">
					<!--标题-->
					<div class="modebox my-booking J_my_booking">
						<div class="hd">
							<h4>会员新增</h4>	
						</div> 	
					</div> 	<!--标题--> 
				<form name="forml" action="__URL__/add" method="post">
					<!--表单-->
					<div class="con">
						<div class="main page-sa page-sa-col Fix">
							<div class="block shop-add-form">
								<!--表单内容-->
								<div class="form-inner">
									<div class="form-block">
										<label class="label label_required" >会员名称：<em>*</em></label>
										<input name="user_name" type="text" maxlength="50"   class="form-txt form-txt-l" autocomplete="off" size="60" value=""/>
										<span id="fv_shopname" style="visibility: hidden; " class="fv-def"></span>
                      			  	</div>    
								                
									<div class="form-block">
										<span class="label label_required">用户等级：<em>*</em></span>
										<select id="ddlShopType"  class="form-select-sim" name="grade">
											<option selected="selected" value="null">请选择等级</option>	
											<option value="VIP">VIP</option>
											<option value="S-VIP">S-VIP</option>
										</select>

									</div>

									<div class="form-block">
										<label class="label label_required" >手机号码：<em>*</em></label>
										<input name="cellphone" type="text" maxlength="50"   class="form-txt form-txt-l" autocomplete="off" size="60" value=""/>
										<span id="fv_shopname" style="visibility: hidden; " class="fv-def"></span>
                      			  	</div>
									<div class="form-block">
										<label class="label label_required">邮箱地址：<em>*</em></label>
										<input name="email" type="email" maxlength="50"   class="form-txt form-txt-l" autocomplete="off" size="60" value=""/>
										<span id="fv_shopname" style="visibility: hidden; " class="fv-def"></span>
                      			  	</div>
									<div class="form-block">
										<span class="label abel_required">积分：</span>
										<input name="score" type="text"  maxlength="20" class="form-txt form-txt-l" autocomplete="off" value="" size="50"/>
										
									</div> 		
									<div class="form-block">
										<span class="label abel_required">车牌号：</span>
										<input name="car_id"type="text"  maxlength="20" class="form-txt form-txt-l" autocomplete="off" value="" size="50"/>
										
									</div> 	
									<div class="form-block">
										<label class="label label_required" >推荐人：<em>*</em></label>
										<input name="recomender_id" type="text" maxlength="50"   class="form-txt form-txt-l" autocomplete="off" size="60" value="" placeholder="请输入推荐人的编号"/>
										<span id="fv_shopname" style="visibility: hidden; " class="fv-def"></span>
									</div> 										
             
									
                   			 </div><!--表单内容-->
							 <!--提交区域-->
							<div class="block form-btn-block form-block form-content-block">
								<strong class="btn-type-b btn-fn-c">
									<input id="btnAdd" type="submit" value="提交审批" class="form-btn">
								</strong>                       
							</div><!--提交区域-->
							</div>
						</div>		
					</div><!--表单-->
				</form>
				
				
            </div><!---产品信息编辑--->
		</div>
	</div><!---中间主要内容--->
</div><!---主页面---->
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
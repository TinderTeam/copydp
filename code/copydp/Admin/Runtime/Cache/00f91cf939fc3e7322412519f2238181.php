<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<link rel="dns-prefetch" href="http://t1.dpfile.com" />
<link rel="dns-prefetch" href="http://t2.dpfile.com" />
<link rel="dns-prefetch" href="http://t3.dpfile.com" />
<link rel="dns-prefetch" href="http://si1.s1.dpfile.com/" />
<title>团购网站</title>
<link rel="stylesheet" href="http://t2.s2.dpfile.com/t/cssnew/my/rate-pop.min.5ec84ae0b63499fec0e87d82923458a0.css" type="text/css" />
<link type="text/css" href="http://t1.s2.dpfile.com/t/cssnew/my/order.min.5a7226cd2f3426def2f1ad35c9e6efa2.css" rel="stylesheet"/>
<link rel="stylesheet" href="http://t3.s2.dpfile.com/t/cssnew/neworder/page/c.process.min.92c908b76c13b72d9517a6cd433cc597.css" type="text/css" />
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
				<li class="has-line"> <a href="__ROOT__/admin.php/Index/login" class=""><span>后台管理</span></a> </li>
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
	<!--	<div class="wrap">-->
	<div class="wrap">
		<div class="user-nav J_user_nav">
			<ul>
				<li> <a href="__APP__/Admin/member_manage">会员管理</a> <i class="n-arr"></i></li>
				<li class="cur"> <a href="__APP__/Admin/seller_manage">商家管理</a> <i class="n-arr"></i></li>
				<li> <a href="__APP__/Admin/activity_manage">活动管理</a> <i class="n-arr"></i></li>
			</ul>
		</div>
		<div class="user-main">
			<!--<div class="um-con">-->
			<div class="um-con">
				<div class="modebox my-comm J_my_comm" >
					<div class="hd">
						<h4>商户管理</h4>
						<span>管理系统商户</span>
					</div>
					<ul class="tab-filter">
						<li>
							<span>用户ID</span><input type="text"/>
						</li>
						<li>
							<span>名称</span><input type="text"/>
						</li>
						<li>
							<span>城市</span><input type="text"/>
						</li>
						<li>
							<span>分类</span>
							<select>
								<option value="分类" selected>分类</option>
								<option value="分类2">分类2</option>
							</select>
						</li>
						<li>
							<input type="button" value="查询">
							<input type="button" value="新增商家">
						</li>
					</ul>
					<div class="pay-confirm">
						<table width="100%" class="confirm-order-tab" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<th width="10%">用户ID</th>
									<th width="10%">商户名称</th>
									<th width="10%">商户类型</th>	
									<th width="10%">所在城市</th>
									<th width="30%">商户描述</th>							
									<th width="5%">操作</th>
								</tr>
								<tr>
									<td valign="middle" align="left" class="deal">00003</td>
									<td valign="middle" align="left" class="deal">测试商户</td>
									<td align="center" >餐饮</td>
									<td align="center"> 深圳</td>
									<td align="center" >深圳的一家小餐饮店</td>
									<td align="center" >
										<input type="button" value="编辑">
										<input type="button" value="冻结">

									</td>
								</tr>
							<tr>
									<td valign="middle" align="left" class="deal">00003</td>
									<td valign="middle" align="left" class="deal">测试商户</td>
									<td align="center" >餐饮</td>
									<td align="center"> 深圳</td>
									<td align="center" >深圳的一家小餐饮店</td>
									<td align="center" >
										<input type="button" value="编辑">
										<input type="button" value="冻结">
									</td>
								</tr>
								<tr>
									<td valign="middle" align="left" class="deal">00003</td>
									<td valign="middle" align="left" class="deal">测试商户</td>
									<td align="center" >餐饮</td>
									<td align="center"> 深圳</td>
									<td align="center" >深圳的一家小餐饮店</td>
									<td align="center" >
										<input type="button" value="编辑">
										<input type="button" value="冻结">

									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>	<!--<div class="um-con">-->
			<!--<div class="um-con">-->
			<div class="um-con">
				<div class="modebox my-comm J_my_comm" >
					<div class="hd">
						<h4>产品审核</h4>
						<span>审核商铺上传的产品信息</span>
					</div>
					<ul class="tab-filter">
						<li>
							<span>用户ID</span><input type="text"/>
						</li>
						<li>
							<span>产品</span><input type="text"/>
						</li>
						<li>
							<span>城市</span><input type="text"/>
						</li>
						<li>
							<span>分类</span>
							<select>
								<option value="分类" selected>分类</option>
								<option value="分类2">分类2</option>
							</select>
						</li>
						<li>
							<input type="button" value="查询">
						</li>
					</ul>
					<div class="pay-confirm">
					<table width="100%" class="confirm-order-tab" cellpadding="0" cellspacing="0">
						<thead>
							<tr>
								<th width="5%">全选<input type="checkbox"></th>
								<th>
									商家ID
								</th>
								<th>
									产品名
								</th>
								<th>
									描述
								</th>
								<th>
									金额
								</th>
	
								<th>
									操作
								</th>	
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td class="t-check">
								   <input type="checkbox"/>
								</td>
								<td class="t-check">
								  123456
								</td>
								<td class="t-order">
									<div class="pic">
										<a href="/deal/5284492"><img src="http://t3.s1.dpfile.com/pc/mc/87c0d70ca51169d33a9f49379de6867c(160c100)/thumb.jpg" width="85" height="53" /></a>
									</div>

                                <div class="txt">
                                    <h4>
                                        <a href="/deal/5284492">
											    横店影城:2D/3D电影票2选1
                                        </a>
                                    </h4>
                                    <h5>
                                        <span>
                                                过期时间：2014-10-01
                                        </span>
                                    </h5>
                                </div>

                            </td>
                            <td class="t-time">
                                描述内容
                            </td>
                            <td class="t-amount">
                                <span>200</span>
                            </td>

                            <td class="t-op">
                            	<input type="button" value="审批">
								<input type="button" value="退回">
                            </td>                  
                        </tr>
						 </tbody>
						 </table>
						 <input type="button" value="批量审批">
						 <input type="button" value="批量退回">
						 </div><!---<div class="pay-confirm">--->
					</div><!---<div class="modebox my-comm J_my_comm" >--->
				</div><!--<div class="um-con">-->
				
				
			</div><!--<div class="user-main">-->
		</div><!--	<div class="wrap">-->
</body>
</html>
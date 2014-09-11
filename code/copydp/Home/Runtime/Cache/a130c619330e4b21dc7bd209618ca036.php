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
				<li class="cur"> <a href="/account/usercenter">商户管理</a> <i class="n-arr"></i> </li>
				<li > <a href="/account/coupons">产品管理</a> <i class="n-arr"></i>
					<ul>
						<li > <a href="/account/orders/0">团购管理</a> <i class="n-arr"></i> </li>
						<li > <a href="/account/orders/0">活动管理</a> <i class="n-arr"></i> </li>
					</ul>
				</li>
				<li > <a href="/account/coupons">订单管理</a> <i class="n-arr"></i>
					<ul>
						<li > <a href="/account/orders/0">团购订单管理</a> <i class="n-arr"></i> </li>
						<li > <a href="/account/orders/0">活动申请管理</a> <i class="n-arr"></i> </li>
					</ul>
				</li>
			</ul>
		</div>
		 

	  <div class="main_w Tabs-page user-main  page-account">	
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
							<li><a track="|1|module#5_my_info,action#click,index#3,content#/account/coupons" href="/account/coupons"> <strong>1</strong>已有订单</a></li>	
							<li><a track="|1|module#5_my_info,action#click,index#3,content#/account/coupons" href="/account/coupons"> <strong>1</strong>未处理</a></li>	
							<li><a track="|1|module#5_my_info,action#click,index#3,content#/account/coupons" href="/account/coupons"> <strong>1</strong>已过期</a></li>						
						</ul>
					</div>
				</div>
	
			 <div class="um-con">
            <div class="con-tab">
<ul class="tab-line">
    <li  class="cur">
        <a href="/account/orders/0">团购订单</a>
    </li>
    <li >
        <a href="/account/giftcard">活动</a>
    </li>
</ul>                <ul class="tab-filter">
                    <li><a href="#"  data-id="check-order" data-eval-config="{'type':'all'}"
                           class="checkbox checkbox-ok">
                        <i></i>
                        <span>全选</span></a></li>
<li>
    <a track="|1|module#2_nav_myorders,action#click,index#2,content#/account/orders/0"
        href="/account/orders/0">已下单</a></li>
		<li>
    <a track="|1|module#2_nav_myorders,action#click,index#2,content#/account/orders/0"
        href="/account/orders/0">已取消</a></li>
<li>
    <a track="|1|module#2_nav_myorders,action#click,index#3,content#/account/orders/1"
       href="/account/orders/1">已使用</a></li>
	   <li>
	   		<select style="width:120px">
				<option>按照产品筛选</option>
			</select>
			</li>

	                </ul>             
            </div>

            <div class="con-list">
                <table>
                    <thead>
                    <tr>
                        <th class="t-check"></th>
                        <th class="t-order">
                            订单信息
                        </th>
                        <th class="t-time">
                            下单时间
                        </th>
                        <th class="t-amount">
                            数量
                        </th>
                        <th class="t-price">
                            金额
                        </th>
                        <th class="t-status">
                            交易状态
                        </th>
                        <th class="t-op">
                            操作
                        </th>
                        <th class="t-delete"></th>
                    </tr>

                    </thead>
                    <tbody>

                        <tr data-id="order-item" data-orderid="309225927">
                            <td class="t-check">
                                <a href="#"  data-id="check-order" data-eval-config="{'type':'single'}"
                                   class="checkbox checkbox-ok"><i></i></a>
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
                                            订单号：309225927
                                        </span>
                                    </h5>
                                    <h5>
                                        <span>
                                                过期时间：2014-10-01
                                        </span>
                                    </h5>
                                </div>

                            </td>
                            <td class="t-time">
                                <span>2014-07-28</span>
                            </td>
                            <td class="t-amount">
                                <span>2</span>
                            </td>
                            <td class="t-price">
                                <span>&#165;50</span>
                            </td>
                            <td class="t-status">
                            <div>已使用</div>
                            </td>
                            <td class="t-op">
                                <a href='/account/coupons/order_309225927'>使用确认</a>
                            </td>
                            <td class="t-delete">
                                <a href="#"  data-id="delete-order" data-eval-config="{'type':'single'}"  class="deletebox Hide">
                                    <i></i>
                                </a>
                            </td>
                        </tr>
                        <tr data-id="order-item" data-orderid="291545547">
                            <td class="t-check">
                                <a href="#"  data-id="check-order" data-eval-config="{'type':'single'}"
                                   class="checkbox checkbox-dis"><i></i></a>
                            </td>
                            <td class="t-order">
                                <div class="pic">
                                    <a href="/deal/5236192"><img src="http://t1.s1.dpfile.com/pc/mc/9f6275722e101caab92553abb52c41a5(160c100)/thumb.jpg" width="85" height="53" /></a>
                                </div>

                                <div class="txt">
                                    <h4>
                                        <a href="/deal/5236192">
											    中影星河电影城:电影票2选1
                                        </a>
                                    </h4>
                                    <h5>
                                        <span>
                                            订单号：291545547
                                        </span>
                                    </h5>
                                    <h5>
                                        <span>
                                                过期时间：2014-12-29
                                        </span>
                                    </h5>
                                </div>

                            </td>
                            <td class="t-time">
                                <span>2014-07-04</span>
                            </td>
                            <td class="t-amount">
                                <span>2</span>
                            </td>
                            <td class="t-price">
                                <span>&#165;51.6</span>
                            </td>
                            <td class="t-status">
                            <div><span class="ok">未使用：2</span></div>
                            </td>
                            <td class="t-op">
                                <a href='/account/coupons/order_291545547'>使用确认</a>
								<a href='/receipt/refund/346173366'>申请作废</a>
                            </td>
                            <td class="t-delete">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="pages-wrap">
                </div>
            </div>

        </div>
    </div>

			
			<div class="um-con">
			
				<!--订单管理-->
				<div class="modebox my-booking J_my_booking">
					<div class="hd">
						<h4>订单管理</h4>
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
			<div class="um-con">
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
	
	
		<div class="um-con">
			<div class="modebox my-comm J_my_comm" >
				<div class="hd">
				<h4>产品管理</h4>
				<span>管理您的团购产品</span>
			</div>
			<input type="button" value="新增产品">
			<div class="pay-confirm">
				<table width="100%" class="confirm-order-tab" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<th width="10%">产品名称</th>
							<th width="30%">产品描述</th>
							<th width="10%">图片预览</th>
							<th width="10%">价格</th>
							<th width="15%">开始时间</th>
							<th width="10%">当前状态</th>
							<th width="5%">操作</th>
						</tr>
						<tr>
							<td valign="middle" align="left" class="deal">团购1</td>
							<td valign="middle" align="left" class="deal">仅售22.5元，价值30元代金券，不限时段通用，免费WiFi，免费停车位！限抵扣30元以内产品，超出需另交费！</td>
							<td align="center" ><img src="img/thumb.jpg" width="100px"></td>
							<td align="center"> &#165;50（原价：&#165;100）</td>
							<td align="center" >2014-9-10</td>
							<td align="center"><select >
								<option value="进行中" selected="selected">进行中</option>
								<option value="进行中">已停止</option>
							</select></td>
							<td align="center" ><input type="button" value="删除"><input type="button" value="编辑"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
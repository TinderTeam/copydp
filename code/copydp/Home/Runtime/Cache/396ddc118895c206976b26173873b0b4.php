<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<link rel="dns-prefetch" href="http://t1.dpfile.com" />
<link rel="dns-prefetch" href="http://t2.dpfile.com" />
<link rel="dns-prefetch" href="http://t3.dpfile.com" />
<link rel="dns-prefetch" href="http://si1.s1.dpfile.com/" />
<title>团购网站</title>
<link rel="Shortcut Icon" href="http://t3.s2.dpfile.com/t/res/favicon.5ff777c11d7833e57e01c9d192b7e427.ico" type="image/x-icon" />
<link rel="stylesheet" href="http://t3.s2.dpfile.com/t/cssnew/newhome/index.min.f0d842c5a6164286508bc847f37723b1.css" type="text/css" />

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
				<li class="has-line"> <a target="_blank" class=""><span>会员中心</span></a> </li>
				<li class="has-line"> <a target="_blank" class=""><span>商家中心</span></a> </li>
				<li class="has-line"> <a target="_blank" class=""><span>后台管理</span></a> </li>
			</ul>
		</div>
	</div>	<!---标题栏---->
	
	
	<div class="head responsive">
		<div class="head-qmenu head-qmenu-new cont Fix">
			<div >
				<a href="__APP__/Index/index"> <img src="__PUBLIC__/img/logo.jpg" style="top: 5px;"> </a>
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
				<div class="nav-drop solid">
					<a class="drop-title J_drop_title" > <span> 商家分类 </span> </a>
					<ul class="drop-list J_drop_list">
						<li class="has-sub drop-item">
							<div class="cat Fix">
								<a class="cat-l1" href="#" > <span> 美食 </span> </a> <br>
								<a class="cat-l2" href="#"> <span> 自助餐 </span> </a> <a class="cat-l2" href="#"> <span> 甜品饮料 </span> </a> <a class="cat-l2" href="#"> <span> 烧烤烤肉 </span> </a>
							</div>
						</li>
						<li class="has-sub drop-item">
							<div class="cat Fix">
								<a class="cat-l1" href="#"> <span> 电影 </span> </a> <br>
							</div>
						</li>
						<li class="has-sub drop-item">
							<div class="cat Fix">
								<a class="cat-l1" href="#"> <span> 酒店 </span> </a> <br>
								<a class="cat-l2" href="#"> <span> 经济/客栈 </span> </a> <a class="cat-l2" href="#"> <span> 五星/豪华 </span> </a>
							</div>
						</li>
						<li class="has-sub drop-item">
							<div class="cat Fix">
								<a class="cat-l1" href="#" > <span> 休闲娱乐 </span> </a> <br>
								<a class="cat-l2" href="#" > <span> KTV </span> </a> <a class="cat-l2" href="#"> <span> 温泉/浴场 </span> </a> <a class="cat-l2" href="#"> <span> 景点郊游 </span> </a>
							</div>
						</li>
						<li class="has-sub drop-item">
							<div class="cat Fix">
								<a class="cat-l1" href=""> <span> 丽人 </span> </a> <br>
								<a class="cat-l2" href=""> <span> 个性写真 </span> </a> <a class="cat-l2" href=""> <span> 美发 </span> </a> <a class="cat-l2" href=""> <span> 美容美体 </span> </a>
							</div>
						</li>
						<li class="has-sub drop-item">
							<div class="cat Fix">
								<a class="cat-l1" href=""> <span> 购物 </span> </a> <br>
								<a class="cat-l2" href=""> <span> 服饰鞋包 </span> </a> <a class="cat-l2" href=""> <span> 生活家居 </span> </a> <a class="cat-l2" href=""> <span> 食品饮料 </span> </a>
							</div>
						</li>
						<li class="has-sub drop-item">
							<div class="cat Fix">
								<a class="cat-l1" href=""> <span> 生活服务 </span> </a> <br>
								<a class="cat-l2" href=""> <span> 装修设计 </span> </a> <a class="cat-l2" href=""> <span> 汽车服务 </span> </a> <a class="cat-l2" href=""> <span> 体检保健 </span> </a>
							</div>
						</li>
					</ul>
				</div>
				<!-----主菜单---->
				<ul class="nav">
					<li> <a  href="__APP__/Index/index"> <span> 网站首页 </span> </a> </li>
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
	<div class="wrap responsive">
		<div class="land">
			<!-----最新咨询---->
			<ul class="location">
		   <li>
				<dl class="Fix J_list">
					<dt class="loc-1">商户分类</dt>
					<dd class="J_content">
									<a>电影</a>
						<a>面包甜点</a>
						<a>小吃快餐</a>
						<a>火锅</a>
						<a>自助餐</a>
						<a>情侣影院</a>
						<a>日韩料理</a>
						<a>西餐</a>
						<a>经济型酒店</a>
						<a>粤菜</a>
						<a>生活家居</a>
						<a>KTV</a>
						<a>景点郊游</a>
						<a>食品饮料</a>
						<a>服饰鞋包</a>
					</dd>
				</dl>
			</li>

		   
			<li>
				<dl class="Fix J_list">
					<dt class="loc-2">商户区域</dt>
					<dd class="J_content">
							<a>地铁沿线</a>
							<a>福田区</a>
							<a>南山区</a>
								<a>福田区</a>
							<a>南山区</a>
								<a>福田区</a>
							<a>南山区</a>
								<a>福田区</a>
							<a>南山区</a>
								<a>福田区</a>
							<a>南山区</a>
								<a>福田区</a>
							<a>南山区</a>
							</dd>

					<dd class="J_more more Hide"><a href="#"></a></dd>
				</dl>
			</li>

			<li class="">
				<dl class="Fix J_list">
					<dt class="loc-3">热门商区</dt>
					<dd class="J_content">
							<a>华强北</a>
							<a>华强北</a>
							<a>华强北</a>
							<a>华强北</a>
							<a>华强北</a>
							<a>华强北</a>
							<a>华强北</a>
							<a>华强北</a>
							
							</dd>
				</dl>
			</li>
		</ul>
		<div class="big-promo Fix">
		<div class="promo-container">
			<div class="promo-switch J_promo_switch">
				<h2>商户精选</h2>
				<ul class="promo-wrap J_promo_wrap" data-mode="render" style="position: absolute; left: -366520px;">
				
					<li class="promo-item J_promo_item" data-track-lock="1" style="position: absolute; float: none; left: 366520px;">
						<a title="玛喜达韩国年糕料理" target="_blank" href="">
							<img src="__PUBLIC__/img/1jpg.jpg" width="330" height="206" style="float:left;" >
							
							<div class="title">
								<div class="title-text">
									<h3>    [2店通用] 玛喜达韩国年糕料理 </h3>
									<h4>双人套餐，无需预约，北一路万达店隆重开业！</h4>
									<div class="mask"></div>
								</div>
								<h5 class="price">¥<em>59</em></h5>
							</div>
							</a>					</li>
					
					<li class="promo-item J_promo_item" data-track-lock="1" style="position: absolute; float: none; left: 366860px;">
						<a title="DQ冰淇淋" target="_blank" href="#">
							<img src="__PUBLIC__/img/2.jpg" width="330" height="206" style="float:left;" >
							<div class="title">
								<div class="title-text">
									<h3>    [7店通用] DQ冰淇淋 </h3>
									<h4>DQ暴风雪2杯（中杯+可爱杯），无需预约，节假日通用！</h4>
									<div class="mask"></div>
								</div>
								<h5 class="price">¥<em>20</em> </h5>
							</div>
							</a>
							</li>
				</ul>
				
				 <div class="promo-ctrl J_ctrl">
			
					<ul class="Fix">
					<li class="">
							<a href="#" data="1" rel="nofollow" track="|1|module#5_rec_gooddeal,action#click,index#998"></a>						</li>
						<li class="">
							<a href="#" data="2" rel="nofollow" track="|1|module#5_rec_gooddeal,action#click,index#998"></a>						</li>
						<li class="">
							<a href="#" data="3" rel="nofollow" track="|1|module#5_rec_gooddeal,action#click,index#998"></a>						</li>
						<li class="">
							<a href="#" data="4" rel="nofollow" track="|1|module#5_rec_gooddeal,action#click,index#998"></a>						</li>
						<li class="on">
							<a href="#" data="5" rel="nofollow" track="|1|module#5_rec_gooddeal,action#click,index#998"></a>						</li>
					</ul>
				</div>
			</div>
		</div>
	</div> 
			<!-----最新咨询---->
		</div>
		
		<!----功能模块最新信息---->
		<div class="promo">

			
			<div class="promo-commbo J_promo_tab J_promo_box"><!----联盟商户---->
				<div class="promo-tab Fix">
					<div class="tab-col J_tab_col n-deal on">
						<a href="javascript:void(0)" class="J_tab_item"><span>联盟商户</span></a>
					</div>
				</div>
				<div class="promo-list-item J_promo_list_item Hide on">
					<div class="promo-window J_promo_window">
						<ul class="promo-window-wrap J_promo_window_wrap" data-mode="render">
							<li class="promo-window-item J_promo_window_item"> <a title="大树餐厅" target="_blank" href="#"> <img src="__PUBLIC__/img/4.jpg" width="180" height="112" style="float:left;" >
								<div class="window-title">
									<h3> [多商区]  大树餐厅 </h3>
									<h4>代金券，无需预约，节假日通用！ </h4>
									<div class="mask">
									</div>
									<h5>¥<em>69</em> </h5>
									<h6>¥<em>100</em> </h6>
								</div>
								</a> </li>
							<li class="promo-window-item J_promo_window_item"> <a title="缪氏川菜" target="_blank" href="/deal/8027897"> <img src="__PUBLIC__/img/5.jpg" width="180" height="112" style="float:left;" >
								<div class="window-title">
									<h3>[多商区]缪氏川菜</h3>
									<h4>代金券，不限时段通用，节假日通用！贺缪氏川菜进驻龙华九方购物中心！（另有其他套餐可选）</h4>
									<div class="mask">
									</div>
									<h5>¥<em>65</em></h5>
									<h6>¥<em>100</em></h6>
								</div>
								</a> </li>
							<li class="promo-window-item J_promo_window_item" data-track-lock="1"> <a title="马家烧麦馆" target="_blank" href="#"> <img src="__PUBLIC__/img/6.jpg" width="180" height="112" style="float:left;" >
								<div class="window-title">
									<h3> [3店通用] 马家烧麦馆 </h3>
									<h4>代金券，节假日通用！ </h4>
									<div class="mask">
									</div>
									<h5>¥<em>39.9</em> </h5>
									<h6>¥<em>50</em> </h6>
								</div>
								</a> </li>
							<li class="promo-window-item J_promo_window_item" data-track-lock="1"> <a title="黑姆奇时尚韩餐" target="_blank" href="#"> <img src="__PUBLIC__/img/7.jpg" width="180" height="112" style="float:left;" >
								<div class="window-title">
									<h3> [东中街]  黑姆奇时尚韩餐 </h3>
									<h4>超值双人套餐，无需预约，节假日通用！ </h4>
									<div class="mask">
									</div>
									<h5>¥<em>49</em> </h5>
									<h6>¥<em>132</em> </h6>
								</div>
								</a> </li>
						</ul>
					</div>
					<div class="panel-foot">
						<div class="promo-window-ctrl panel-ctrl J_promo_window_ctrl">
							<a href="#">查看全部»</a>						
						</div>
					</div>
				</div>
			</div><!----联盟商户---->
			<div class="promo-commbo J_promo_tab J_promo_box"><!----新进商家---->
				<div class="promo-tab Fix">
					<div class="tab-col J_tab_col n-deal on">
						<a href="javascript:void(0)" class="J_tab_item"><span>新进商家</span></a>
					</div>
				</div>
				<div class="promo-list-item J_promo_list_item Hide on">
					<div class="promo-window J_promo_window">
						<ul class="promo-window-wrap J_promo_window_wrap" data-mode="render">
							<li class="promo-window-item J_promo_window_item"> <a title="大树餐厅" target="_blank" href="#"> <img src="__PUBLIC__/img/4.jpg" width="180" height="112" style="float:left;" >
								<div class="window-title">
									<h3> [多商区]  大树餐厅 </h3>
									<h4>代金券，无需预约，节假日通用！ </h4>						
								</div>
								</a> </li>
							<li class="promo-window-item J_promo_window_item"> <a title="缪氏川菜" target="_blank" href="/deal/8027897"> <img src="__PUBLIC__/img/5.jpg" width="180" height="112" style="float:left;" >
								<div class="window-title">
									<h3>[多商区]缪氏川菜</h3>
									<h4>代金券，不限时段通用，节假日通用！贺缪氏川菜进驻龙华九方购物中心！（另有其他套餐可选）</h4>							
								</div>
								</a> </li>
							<li class="promo-window-item J_promo_window_item" data-track-lock="1"> <a title="马家烧麦馆" target="_blank" href="#"> <img src="__PUBLIC__/img/6.jpg" width="180" height="112" style="float:left;" >
								<div class="window-title">
									<h3> [3店通用] 马家烧麦馆 </h3>
									<h4>代金券，节假日通用！ </h4>		
								</div>
								</a> </li>
							<li class="promo-window-item J_promo_window_item" data-track-lock="1"> <a title="黑姆奇时尚韩餐" target="_blank" href="#"> <img src="__PUBLIC__/img/7.jpg" width="180" height="112" style="float:left;" >
								<div class="window-title">
									<h3> [东中街]  黑姆奇时尚韩餐 </h3>
									<h4>超值双人套餐，无需预约，节假日通用！ </h4>
								</div>
								</a> </li>
						</ul>
					</div>
					<div class="panel-foot">
						<div class="promo-window-ctrl panel-ctrl J_promo_window_ctrl">
							<a href="#">查看全部»</a>						
						</div>
					</div>
				</div>
			</div><!----新进商家---->
		</div>
		
		<div class="side">
			<div style="index_switch J_switch imgloading">
				<img src="__PUBLIC__/img/3.jpg" height="185">
			</div>
			<div class="hot region J_hot Hide">
			</div>
			<div class="feedback region sidebox sidebox-collapse">
				<h3> <span>意见反馈</span> </h3>
				<div class="voice Fix">
					<img src="__PUBLIC__/img/a.png"> <span>我们希望听到你的声音<br />
					<a>提交意见反馈»</a></span>
				</div>
			</div>
			<div class="feedback region sidebox">
				<h3> <span>商务合作</span> </h3>
				<div class="voice Fix">
					<img src="__PUBLIC__/img/b.png"> <span>希望在这里组织团购吗？<br />
					<a>提交需求»</a></span>
				</div>
			</div>
			<div class="recent-box-holder">
			</div>
			<div class="recent-box sidebox region">
				<h3><span>最近浏览</span></h3>
				<ul>
					<li>暂无浏览记录</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 美食结束-->
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
</body>
</html>
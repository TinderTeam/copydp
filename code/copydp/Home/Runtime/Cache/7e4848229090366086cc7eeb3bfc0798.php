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
				<!-----分类菜单---->
					<div class="nav-drop solid">
	<a class="drop-title J_drop_title" > <span> 全部分类 </span> </a>
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
				<!-----分类菜单---->
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
	<div class="wrap responsive">
		<div class="land">
			<!-----最新咨询---->
			<ul class="location">
				<li>
					<dl class="Fix J_list">
						<dt class="loc-1">最新咨询</dt>
					</dl>
				</li>
				
		
				<li>
					<dl class="Fix J_list">
						<dd class="J_content"> <a>龙虾汤鸡腿饭，初秋吃不停hot2503人气</a> </dd>
						<span>2014-9-10</span>
					</dl>
				</li>
				<li>
					<dl class="Fix J_list">
						<dd class="J_content"><a>奶香浓郁的斯利美沙冰，越吃越想吃1987人气</a> </dd>
						<span>2014-9-10</span>
					</dl>
				</li>
				<li>
					<dl class="Fix J_list">
						<dd class="J_content"> <a>龙虾汤鸡腿饭，初秋吃不停hot2503人气</a> </dd>
						<span>2014-9-10</span>
					</dl>
				</li>
				<li>
					<dl class="Fix J_list">
						<dd class="J_content"><a>奶香浓郁的斯利美沙冰，越吃越想吃1987人气</a> </dd>
						<span>2014-9-10</span>
					</dl>
				</li><li>
					<dl class="Fix J_list">
						<dd class="J_content"> <a>龙虾汤鸡腿饭，初秋吃不停hot2503人气</a> </dd>
						<span>2014-9-10</span>
					</dl>
				</li>
				<li>
					<dl class="Fix J_list">
						<dd class="J_content"><a>奶香浓郁的斯利美沙冰，越吃越想吃1987人气</a> </dd>
						<span>2014-9-10</span>
					</dl>
				</li><li>
					<dl class="Fix J_list">
						<dd class="J_content"> <a>龙虾汤鸡腿饭，初秋吃不停hot2503人气</a> </dd>
						<span>2014-9-10</span>
					</dl>
				</li>
				<li>
					<dl class="Fix J_list">
						<dd class="J_content"><a>奶香浓郁的斯利美沙冰，越吃越想吃1987人气</a> </dd>
						<span>2014-9-10</span>
					</dl>
				</li>
			</ul>
			<!-----最新咨询---->
		</div>
		
		<!----功能模块最新信息---->
		<div class="promo">
			<div class="promo-commbo J_promo_tab J_promo_box"><!----最新特惠---->
				<div class="promo-tab Fix">
					<div class="tab-col J_tab_col n-deal on">
						<a href="javascript:void(0)" class="J_tab_item"><span>最新特惠</span></a>
					</div>
					<div class="tab-col J_tab_col">
						<a href="javascript:void(0)" class="J_tab_item"><span>推荐商品</span></a>
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
								</a>
							</li>
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
			</div><!----最新特惠---->
			
			
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
		
		
		
		<!-- 最新团购-->
		<div class="floor J_floor" data-mode="render">
			<div class="floor-item J_floor_item">
				<h2> <span>最新团购</span> <img src="__PUBLIC__/img/newtuangou.png"></h2>
				<ul class="floor-link">
					<li> <a href="/shenzhen/c/10s1006" target="_blank">自助餐</a></li>
					<li> <a href="/shenzhen/c/10s1002" target="_blank">甜品饮料</a></li>	
				</ul>
				<ul class="Fix">
					<li class="floor-box J_floor_box" > <a title="顺品甜品屋" target="_blank" href="/deal/155944" >
						<div class="flag">
						</div>
						<img src="img/8.jpg">
						<div class="area J_floor_area Hide">
							<span><i></i>南山中心区、南头、西丽、大小梅沙</span>
						</div>
						<h3>[4店通用]顺品甜品屋</h3>
						<h4>甜品套餐，无需预约，热烈庆祝海岸城新店开业，4店同庆！</h4>
						<div class="mask">
						</div>
						<div class="price">
							<h5>&#165;<em>15.8</em></h5>
							<h6>&#165;<em>39</em></h6>
							<span class="buy"><em>74078</em>人购买</span>
						</div>
						<div class="activity">
						</div>
						</a> </li>
					<li class="floor-box J_floor_box" > <a title="顺品甜品屋" target="_blank" href="/deal/155944" >
						<div class="flag">
						</div>
						<img src="img/9.jpg">
						<div class="area J_floor_area Hide">
							<span><i></i>南山中心区、南头、西丽、大小梅沙</span>
						</div>
						<h3>[4店通用]顺品甜品屋</h3>
						<h4>甜品套餐，无需预约，热烈庆祝海岸城新店开业，4店同庆！</h4>
						<div class="mask">
						</div>
						<div class="price">
							<h5>&#165;<em>15.8</em></h5>
							<h6>&#165;<em>39</em></h6>
							<span class="buy"><em>74078</em>人购买</span>
						</div>
						<div class="activity">
						</div>
						</a> </li>
					<li class="floor-box J_floor_box" > 
						<a title="顺品甜品屋" target="_blank" href="/deal/155944" >
							<div class="flag">
							</div>
							<img src="img/10.jpg">
							<div class="area J_floor_area Hide">
								<span><i></i>南山中心区、南头、西丽、大小梅沙</span>
							</div>
							<h3>[4店通用]顺品甜品屋</h3>
							<h4>甜品套餐，无需预约，热烈庆祝海岸城新店开业，4店同庆！</h4>
							<div class="mask">
							</div>
							<div class="price">
								<h5>&#165;<em>15.8</em></h5>
								<h6>&#165;<em>39</em></h6>
								<span class="buy"><em>74078</em>人购买</span>
							</div>
							<div class="activity">
							</div>
						</a></li>
				</ul>
				<a class="floor-more" target="_blank" href="/shenzhen/c/10"> <span>查看全部美食»</span> </a>
			</div>
		</div>
		<!-- 右侧边栏-->
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
	<!---footer-->
</body>
</html>
<?php if (!defined('THINK_PATH')) exit();?>

<!DOCTYPE html>


<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="dns-prefetch" href="http://t1.dpfile.com"/>
    <link rel="dns-prefetch" href="http://t2.dpfile.com"/>
    <link rel="dns-prefetch" href="http://t3.dpfile.com"/>
    <link rel="dns-prefetch" href="http://si1.s1.dpfile.com/"/>
    <title>【当期优惠】-团购网</title>
    <meta name="viewport"          content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no"/>
	<link rel="stylesheet" href="http://t1.s2.dpfile.com/t/cssnew/newhome/list-new.min.1cea6629ab1ef98647074215ab384f52.css" type="text/css"/> 
</head>
<body id="body" data-type="">
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

<!----主界面---->
<div class="pgm wrap responsive-reverse">
    <div class="section_w top_banner"></div>
	
    <div class="category-box" id="J_category_box">
		<!----导航栏--->
		<div class="bread-box">
			<span href="/dongguan">当期特惠&nbsp;&gt;</span>
			<span class="choose">今日新单<a href="/list/dongguan" class="close"track="">×</a></span>
    		<a href="/list/dongguan">清除</a>
    		<div class="dot-border"></div>
		</div><!----导航栏--->
		<!----分类标签--->
		<div class="category-nav">			
  			<div class="term Fix">
        	<div class="l-title">分类</div>
        	<div class="cont">
				<div class="classify Fix">
					<a class="this" href="/list/dongguan/items_40s9153">
					不限
					</a>
					<a  href="/list/dongguan-category_1/items_40s9153">
					美食
					</a>
					<a  href="/list/dongguan-category_3/items_40s9153">
					休闲娱乐
					</a>
					<a  href="/list/dongguan-category_4/items_40s9153">
					酒店
					</a>
					<a  href="/list/dongguan-category_7/items_40s9153">
					购物
					</a>
					<a  href="/list/dongguan-category_6/items_40s9153">
					旅游
					</a>
					<a  href="/list/dongguan-category_9/items_40s9153">
					亲子
					</a>
            	</div>
            	<div class="desc-bg Fix Hide"></div>
       		</div>
		</div><!----分类标签--->	

		<!---筛选功能*---->
   		<div class="categ-sort Fix" data-id="sort-region">
            <div class="categ-group">
				<a href="/list/dongguan/items_40s9153"
				   class="categ-item has">
					<span>默认排序</span>
				</a>
				<a href="/list/dongguan/items_40s9153?desc=1&sort=sale"
				   class="categ-item ">
					<span>销量最高</span>
				</a>
				<a href="/list/dongguan/items_40s9153?desc=1&sort=new"
				   class="categ-item ">
					<span>发布最新</span>
				</a>
				<a href="/list/dongguan/items_40s9153?sort=price"
				   class="categ-item ">
					<span>价格最低</span>
				</a>
            </div>
			<!----综合筛选---
            <div class="categ-group">
				<a class="checkbox checkbox-on categ-simple"
				   href="/list/dongguan">
					<i></i>
					<span>今日新单</span>
				</a>
				<a class="checkbox checkbox-ok categ-simple"
				   href="/list/dongguan/items_21s8946_40s9153">
					<i></i>
					<span>免预约</span>
				</a>
				<a class="checkbox checkbox-ok categ-simple"
				   href="/list/dongguan/items_22s8947_40s9153">
					<i></i>
					<span>节假日可用</span>
				</a>
				<a class="checkbox checkbox-ok categ-simple"
				   href="/list/dongguan/items_24s8949_40s9153">
					<i></i>
					<span>代金券</span>
				</a>
				<a class="checkbox checkbox-dis categ-simple"
				   href="#">
					<i></i>
						<b class="new"></b>
					<span class="red">返现</span>
				</a>
				<a class="checkbox checkbox-dis categ-simple"
				   href="#">
					<i></i>
					<span>立减</span>
				</a>
            </div><!----综合筛选---->
		</div><!---筛选功能*---->
    </div>


	<div class="floor J_floor" data-mode="render">
		<div class="floor-item">
			<ul class="Fix">
				<li class="floor-box J_floor_box" did="8057385">
					<a title="" target="_blank" href="/deal/8057385" track="|1|module#5_con_list,action#click,index#1,dealgrp_id#8057385,query_id#">
						<div class="flag">
							<span class="f-2"></span>
							<span class="f-3"></span>
						</div>
						<img lazy-src-load="http://i2.s1.dpfile.com/pc/mc/12a84b5a68e7914d3023df256b8d09cf(353c221)/thumb.jpg">
						<h3>    [世博/金月湾/星玺]棒约翰比萨</h3>
						<h4>美式烟熏牛肉比萨，不限时段通用！特制卷边饼底，将芝士藏在饼边里，咬下一口，回味无穷！</h4>
						<div class="mask"></div>
						<div class="price">
							<h5>&#165;<em>41</em></h5>
							<h6>&#165;<em>79</em></h6>
							<span class="buy">
								<em>101</em>人购买
							</span>
						</div>
						<div class="activity">
						</div>
					</a>
				</li>
				<li class="floor-box J_floor_box" did="8057385">
					<a title="" target="_blank" href="/deal/8057385" track="|1|module#5_con_list,action#click,index#1,dealgrp_id#8057385,query_id#">
				  
						<div class="flag">
							<span class="f-1"></span>
							<span class="f-2"></span>
							<span class="f-3"></span>
						</div>
						<img lazy-src-load="http://i2.s1.dpfile.com/pc/mc/12a84b5a68e7914d3023df256b8d09cf(353c221)/thumb.jpg">
						<h3>    [世博/金月湾/星玺]棒约翰比萨</h3>
						<h4>美式烟熏牛肉比萨，不限时段通用！特制卷边饼底，将芝士藏在饼边里，咬下一口，回味无穷！</h4>
						<div class="mask"></div>
						<div class="price">
							<h5>&#165;<em>41</em></h5>
							<h6>&#165;<em>79</em></h6>
							<span class="buy">
								<em>101</em>人购买
							</span>
						</div>
						<div class="activity">
						</div>
					</a>
				</li>
					<li class="floor-box J_floor_box" did="8057385">
					<a title="" target="_blank" href="/deal/8057385" track="|1|module#5_con_list,action#click,index#1,dealgrp_id#8057385,query_id#">
				  
						<div class="flag">
							<span class="f-1"></span>
							<span class="f-2"></span>
							<span class="f-3"></span>
						</div>
						<img lazy-src-load="http://i2.s1.dpfile.com/pc/mc/12a84b5a68e7914d3023df256b8d09cf(353c221)/thumb.jpg">
						<h3>    [世博/金月湾/星玺]棒约翰比萨</h3>
						<h4>美式烟熏牛肉比萨，不限时段通用！特制卷边饼底，将芝士藏在饼边里，咬下一口，回味无穷！</h4>
						<div class="mask"></div>
						<div class="price">
							<h5>&#165;<em>41</em></h5>
							<h6>&#165;<em>79</em></h6>
							<span class="buy">
								<em>101</em>人购买
							</span>
						</div>
						<div class="activity">
						</div>
					</a>
				</li>
					<li class="floor-box J_floor_box" did="8057385">
					<a title="" target="_blank" href="/deal/8057385" track="|1|module#5_con_list,action#click,index#1,dealgrp_id#8057385,query_id#">
				  
						<div class="flag">
							<span class="f-1"></span>
							<span class="f-2"></span>
							<span class="f-3"></span>
						</div>
						<img lazy-src-load="http://i2.s1.dpfile.com/pc/mc/12a84b5a68e7914d3023df256b8d09cf(353c221)/thumb.jpg">
						<h3>    [世博/金月湾/星玺]棒约翰比萨</h3>
						<h4>美式烟熏牛肉比萨，不限时段通用！特制卷边饼底，将芝士藏在饼边里，咬下一口，回味无穷！</h4>
						<div class="mask"></div>
						<div class="price">
							<h5>&#165;<em>41</em></h5>
							<h6>&#165;<em>79</em></h6>
							<span class="buy">
								<em>101</em>人购买
							</span>
						</div>
						<div class="activity">
						</div>
					</a>
				</li>
					<li class="floor-box J_floor_box" did="8057385">
					<a title="" target="_blank" href="/deal/8057385" track="|1|module#5_con_list,action#click,index#1,dealgrp_id#8057385,query_id#">
				  
						<div class="flag">
							<span class="f-1"></span>
							<span class="f-2"></span>
							<span class="f-3"></span>
						</div>
						<img lazy-src-load="http://i2.s1.dpfile.com/pc/mc/12a84b5a68e7914d3023df256b8d09cf(353c221)/thumb.jpg">
						<h3>    [世博/金月湾/星玺]棒约翰比萨</h3>
						<h4>美式烟熏牛肉比萨，不限时段通用！特制卷边饼底，将芝士藏在饼边里，咬下一口，回味无穷！</h4>
						<div class="mask"></div>
						<div class="price">
							<h5>&#165;<em>41</em></h5>
							<h6>&#165;<em>79</em></h6>
							<span class="buy">
								<em>101</em>人购买
							</span>
						</div>
						<div class="activity">
						</div>
					</a>
				</li>
					<li class="floor-box J_floor_box" did="8057385">
					<a title="" target="_blank" href="/deal/8057385" track="|1|module#5_con_list,action#click,index#1,dealgrp_id#8057385,query_id#">
				  
						<div class="flag">
							<span class="f-1"></span>
							<span class="f-2"></span>
							<span class="f-3"></span>
						</div>
						<img lazy-src-load="http://i2.s1.dpfile.com/pc/mc/12a84b5a68e7914d3023df256b8d09cf(353c221)/thumb.jpg">
						<h3>    [世博/金月湾/星玺]棒约翰比萨</h3>
						<h4>美式烟熏牛肉比萨，不限时段通用！特制卷边饼底，将芝士藏在饼边里，咬下一口，回味无穷！</h4>
						<div class="mask"></div>
						<div class="price">
							<h5>&#165;<em>41</em></h5>
							<h6>&#165;<em>79</em></h6>
							<span class="buy">
								<em>101</em>人购买
							</span>
						</div>
						<div class="activity">
						</div>
					</a>
				</li>
					<li class="floor-box J_floor_box" did="8057385">
					<a title="" target="_blank" href="/deal/8057385" track="|1|module#5_con_list,action#click,index#1,dealgrp_id#8057385,query_id#">
				  
						<div class="flag">
							<span class="f-1"></span>
							<span class="f-2"></span>
							<span class="f-3"></span>
						</div>
						<img lazy-src-load="http://i2.s1.dpfile.com/pc/mc/12a84b5a68e7914d3023df256b8d09cf(353c221)/thumb.jpg">
						<h3>    [世博/金月湾/星玺]棒约翰比萨</h3>
						<h4>美式烟熏牛肉比萨，不限时段通用！特制卷边饼底，将芝士藏在饼边里，咬下一口，回味无穷！</h4>
						<div class="mask"></div>
						<div class="price">
							<h5>&#165;<em>41</em></h5>
							<h6>&#165;<em>79</em></h6>
							<span class="buy">
								<em>101</em>人购买
							</span>
						</div>
						<div class="activity">
						</div>
					</a>
				</li>
				<li class="floor-box J_floor_box" did="8057385">
					<a title="" target="_blank" href="/deal/8057385" track="|1|module#5_con_list,action#click,index#1,dealgrp_id#8057385,query_id#">
				  
						<div class="flag">
							<span class="f-2"></span>
							<span class="f-3"></span>
						</div>
						<img lazy-src-load="http://i2.s1.dpfile.com/pc/mc/12a84b5a68e7914d3023df256b8d09cf(353c221)/thumb.jpg">
						<h3>    [世博/金月湾/星玺]棒约翰比萨</h3>
						<h4>美式烟熏牛肉比萨，不限时段通用！特制卷边饼底，将芝士藏在饼边里，咬下一口，回味无穷！</h4>
						<div class="mask"></div>
						<div class="price">
							<h5>&#165;<em>41</em></h5>
							<h6>&#165;<em>79</em></h6>
							<span class="buy">
								<em>101</em>人购买
							</span>
						</div>
						<div class="activity">
						</div>
					</a>
				</li>
			</ul>
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
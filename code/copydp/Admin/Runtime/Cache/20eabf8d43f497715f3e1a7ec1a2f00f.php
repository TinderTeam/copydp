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
	<div class="wrap">
		<div class="user-nav J_user_nav">
			<ul>
				<li class="cur"> <a href="__APP__/Index/index">会员管理</a> <i class="n-arr"></i></li>
				<li> <a href="__APP__/SellerManage/index">商家管理</a> <i class="n-arr"></i></li>
				<li> <a href="__APP__/ActivityManage/index">活动管理</a> <i class="n-arr"></i></li>
			</ul>
		</div>
		<div class="user-main">
			<div class="um-con">
				<div class="modebox my-comm J_my_comm" >
				<form name="forml" action="__URL__/search" method="post">
					<div class="hd">
						<h4>会员管理</h4>
						<span>管理系统用户</span>	
					</div>								
					<ul class="tab-filter">
						<li>
							<span >用户ID</span><input type="text" name="userID"/>
						</li>
						<li>
							<span >名称</span><input type="text" name="userName"/>
						</li>
						<li>
							<span >手机</span><input type="text" name="phoneNum"/>
						</li>
						<li>
							<!-- <input type="submit" value="查询" class="form-btn" /> -->
								<strong class="btn-type-b btn-fn-c">
									<input id="btnAdd" type="submit" value="查询" class="form-btn">
								</strong> 
							<!-- <a href="<?php echo U('Index/userAdd');?>"  type="button" > 新增会员</a> -->
 							
								<strong class="btn-type-b btn-fn-c">
									<a href="<?php echo U('Index/userAdd');?>"  class="form-btn" style="font-color:red!important;">新增会员</a>
								</strong>                       

						</li>
					</ul>

				</form>	
					<div class="pay-confirm">
						<table width="100%" class="confirm-order-tab" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<th width="15%">会员编号</th>
									<th width="15%">会员名称</th>
									<th width="15%">会员级别</th>	
									<th width="15%">当前积分</th>
									<th width="15%">手机</th>	
									<th width="10%">用户状态</th>							
									<th width="15%">操作</th>
								</tr>
						<?php if(is_array($userInfo)): foreach($userInfo as $key=>$v1): ?><tr>
									<td valign="middle" align="left" class="deal"><?php echo ($v1["user_id"]); ?></td>
									<td valign="middle" align="left" class="deal"><?php echo ($v1["user_name"]); ?></td>
									<td align="center" ><?php echo ($v1["grade"]); ?></td>
									<td align="center"> <?php echo ($v1["score"]); ?></td>
									<td align="center" ><?php echo ($v1["cellphone"]); ?></td>
									<td align="center"><?php echo ($v1["status"]); ?></td >		
									<td valign="middle">
										<input type="button" value="解冻">
										<input type="button" value="升级">
									</td>
								</tr><?php endforeach; endif; ?>
						  <tr >
                            <td colspan="7" style=" text-align: center;" ><span><?php echo ($page); ?></span></td>
                          </tr>

							</tbody>
						</table>

					</div>
				</div>
			</div>
			
			
			<div class="um-con">
				<div class="modebox my-comm J_my_comm" >
					<div class="hd">
						<h4>用户请求处理</h4>
						<span>处理用户的升级、解冻、审核请求</span>
					</div>
					<div class="pay-confirm">
						<table width="100%" class="confirm-order-tab" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<th width="10%">会员ID</th>
									<th width="20%">会员名称</th>
									<th width="10%">会员级别</th>	
									<th width="10%">申请类型</th>
									<th width="10%">手机</th>							
									<th width="5%">操作</th>
								</tr>
								<tr>
									<td valign="middle" align="left" class="deal">00001</td>
									<td valign="middle" align="left" class="deal">测试会员</td>
									<td align="center" >VIP</td>
									<td align="center"> 升级</td>
									<td align="center" >18612345678</td>
									<td align="center" >
										<input type="button" value="升级">
									</td>
								</tr>
								<tr>
									<td valign="middle" align="left" class="deal">00002</td>
									<td valign="middle" align="left" class="deal">测试会员</td>
									<td align="center" >VIP</td>
									<td align="center"> 审核</td>
									<td align="center" >18612345678</td>
									<td align="center" >
										<input type="button" value="审核">
									</td>
								</tr>
								<tr>
									<td valign="middle" align="left" class="deal">00003</td>
									<td valign="middle" align="left" class="deal">测试会员</td>
									<td align="center" >SVIP</td>
									<td align="center"> 解冻</td>
									<td align="center" >18612345678</td>
									<td align="center" >
										<input type="button" value="解冻">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="um-con">
				<div class="modebox my-comm J_my_comm" >
					<div class="hd">
						<h4>积分管理</h4>
						<span>管理员对积分进行管理</span>
					</div>
					<ul class="tab-filter">
						<li>
							<span>用户ID</span><input type="text"/>
						</li>
						<li>
							<input type="button" value="查询"/>				
						</li>
					</ul>
					<div class="pay-confirm">
						<table width="100%" class="confirm-order-tab" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<th width="30%">会员ID</th>
									<th width="30%">会员名称</th>
									<th width="20%">变动分值</th>	
									<th width="30%">变更原因</th>						
									<th width="2%">操作</th>
								</tr>
								<tr>
									<td align="center" >12345</td>
									<td align="center" >会员名称</td>
									<td align="center" ><input type="num"></td>
									<td align="center" ><input type="text"></td>
									<td align="center" >
										<input type="button" value="确认">
									</td>
								</tr>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
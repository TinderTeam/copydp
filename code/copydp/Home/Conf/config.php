<?php
return array(
	//'配置项'=>'配置值'

    'SHOW_PAGE_TRACE' =>true, // 显示页面Trace信息
	
	// 添加邮箱配置信息
	'MAIL_ADDRESS'=>'', // 邮箱地址
	'MAIL_SMTP'=>'smtp.qq.com', // 邮箱SMTP服务器
	'MAIL_LOGINNAME'=>'', // 邮箱登录帐号
	'MAIL_PASSWORD'=>'', // 邮箱密码
	
    // 添加数据库配置信息
    'DB_TYPE'   => 'mysql', // 数据库类型
    'DB_HOST'   => 'localhost', // 服务器地址
    'DB_NAME'   => 'copydp', // 数据库名
    'DB_USER'   => 'root', // 用户名
<<<<<<< HEAD
    'DB_PWD'    => '1234', // 密码
=======
    'DB_PWD'    => 'root', // 密码
>>>>>>> a1963e5e33cc41ec3f6afff7596b82559d7ec247
    'DB_PORT'   => 3306, // 端口
    'DB_PREFIX' => 't_', // 数据库表前缀
    
    //数据库类型://用户名:密码@数据库地址:数据库端口/数据库名
    //'DB_DSN' => 'mysql://root:root@localhost:3306/phpmyadmin'
);
?>
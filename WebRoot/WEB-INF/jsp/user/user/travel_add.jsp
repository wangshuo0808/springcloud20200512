<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html  lang="zh">
<head>
	<meta charset="utf-8">
	<title>个人中心 | 驴友网</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/css_user/global.css" media="all">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/css_user/boxy,jquery.fancybox-1.3.4.css">
	<link  href="${pageContext.request.contextPath}/statics/css/css_user/aboutus.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/css_user/reg.css"  />
		
	<script type="text/javascript">
		var userjson = '';
		var c_cityinfo = '';
	</script>
</head>
<body>
<div class="header">
    <div class="headWrap">
        <div class="headTop fn-clear">
            <h1 class="logo">
                <a href="index.htm" title="驴友网" style="float: left;" >驴友网</a>
            </h1>
            <h2 class="slogan" title="在旅途中相遇">在旅途中相遇</h2>

            <div class="loginInfo">                
                <ul class="not_login">
                <!-- 未登录 
                    <li style="float:right"><a href="../login/register.htm" class="btn_reg">注册</a></li>
                    <li  style="float:right"><a href="../login/login.htm"  id="top-nav-login" class="btn_login">登录</a></li>
				-->
					<li style="float:right"><a href="#">注销</a></li>                                        
					<li style="float:right"><a href="#">好友申请（0）</a>&nbsp;&nbsp;&nbsp;</li>
					<li style="float:right"><a href="#">站内信（0）</a>&nbsp;&nbsp;&nbsp;</li>
					<li style="float:right"><a href="#">chen10301002</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
                </ul>
            </div>
        </div>

    <ul class="dropdown">
            <li>
                <a href="index.jsp" >首页</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/tomemory">旅游记忆</a>
            </li>
            <li>
				<a href="${pageContext.request.contextPath}/totraveller">结伴游</a>
			</li>
            <li>
				<a href="${pageContext.request.contextPath}/tostrategy">景点攻略</a>
			</li>
		</ul>
				 
		<div class="navSearch">
			<form action="memory_search.htm" method="get" id="searchForm" target="_blank">
				<input name="k" type="text" class="top-search-input" id="searchKey" value="搜索旅游记忆" maxlength="50" autocomplete="off"/>
                <input name="" type="submit" value="搜索" class="search_btn">
            </form>
			<div id="keyword_tip_content"></div>
		</div>
	</div>
</div>
<!--top end-->

<div id="container" class="fn-clear">

	<div class="bottom">
    	<div class="bottom_t"></div>
        <div class="bottom_c h650">
       	  <div class="bottom_c_l">
		  
           	  <div class="title01"> 动态 </div>
              <div class="list01 bk">
                <ul>
                    <li>
						<a href="#"><div class="icon_bot"><img src="${pageContext.request.contextPath}/statics/images/images_user/help13.png"></div>我的动态</a>
					</li>
                    <li>
						<a href="#"><div class="icon_bot"><img src="${pageContext.request.contextPath}/statics/images/images_user/help13.png"></div>好友动态</a>
					</li>
                </ul>
			  </div>
			  
           	  <div class="title01"> 我的记忆 </div>
              <div class="list01 bk">
                <ul>
                    <li>
						<a href="#"><div class="icon_bot"><img src="${pageContext.request.contextPath}/statics/images/images_user/help12.png"></div>发布新记忆</a>
					</li>
                    <li>
						<a href="#"><div class="icon_bot"><img src="${pageContext.request.contextPath}/statics/images/images_user/help14.png"></div>全部记忆</a>
					</li>
                </ul>
			  </div>	
			  
           	  <div class="title01"> 相约驴友 </div>
              <div class="list01 bk">
                <ul>
                    <li class="un">
						<a href="#"><div class="icon_bot"><img src="${pageContext.request.contextPath}/statics/images/images_user/help12.png"></div>发起旅游</a>
					</li>
                    <li>
						<a href="#"><div class="icon_bot"><img src="${pageContext.request.contextPath}/statics/images/images_user/help13.png"></div>我发起的旅游</a>
					</li>
                </ul>
			  </div>
			  
           	  <div class="title01"> 我的好友 </div>
              <div class="list01 bk">
                <ul>
                    <li>
						<a href="#"><div class="icon_bot"><img src="${pageContext.request.contextPath}/statics/images/images_user/help12.png"></div>好友列表</a>
					</li>
                </ul>
			  </div>
			  
           	  <div class="title01">账号管理</div>
              <div class="list01 bk">
                <ul>
                    <li>
						<a href="#"><div class="icon_bot"><img src="${pageContext.request.contextPath}/statics/images/images_user/help12.png"></div>基本信息</a>
					</li>
                    <li>
						<a href="#"><div class="icon_bot"><img src="${pageContext.request.contextPath}/statics/images/images_user/help13.png"></div>修改头像</a>
					</li>
                    <li>                    
						<a href="#"> <div class="icon_bot"><img src="${pageContext.request.contextPath}/statics/images/images_user/help14.png"></div>修改密码</a>
					</li>
                </ul>
			</div>	
													
		</div>
		
		<div class="bottom_c_r">
			<h2 style="width:680px; height:40px; line-height:41px; background:#83bb4a url(${pageContext.request.contextPath}/statics/images/images_user/reg-title-bg.png) repeat-x; 
						color:#fefefe; text-indent:25px; font-size:20px; font-family:\9ED1\4F53; font-weight:400;">发起旅游</h2>
			<form id="form100" action="login.htm" method="post" class="reg-form" >
				<p><label for="nickname"><em>*</em>标题：</label>
                   <input name="nickname" type="text"  class="input-txt" id="nickname" autocomplete="off" size="43" />
                </p>
				<p><label for="password"><em>*</em>起始日期：</label>
                   <input type="text" class="input-txt" autocomplete="off" size="43" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </p>
				<p><label for="nickname"><em>*</em>返回日期：</label>
                   <input type="text" class="input-txt" autocomplete="off" size="43" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </p>
				<p><label for="nickname"><em>*</em>联系方式：</label>
                   <input name="nickname" type="text"  class="input-txt" id="nickname" autocomplete="off" size="43" />
                </p>
				<p><label for="nickname"><em>*</em>内容：</label>
					<textarea rows="5" cols="60" id="nickname"  size="43" ></textarea>
				</p><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
               	<a href="../index.htm" class="reg-login">发布</a>
			</form>
		</div>
	</div>
	</div>	
</div>
<!-- 底部footer 开始-->

<div class="footer " >
    <div class="footerWrap fn-clear">
        <ul class="about_roadqu ">
            <li><a href="#">关于驴友</a>|</li>
            <li><a href="#">联系我们</a>|</li>
            <li><a href="#">用户公约</a>|</li>
            <li><a href="#">意见反馈</a>|</li>
            <li><a href="#">帮助中心</a>|</li>
            <li><a href="#">友情链接</a></li>   
        </ul>
        <div class="foot">
			<p><span>版权所有软件1001班
			<a href="#" >陈文平</a><a href="#" > 胡剑彬</a><a href="#" >林清华</a><a href="#" >汤怡青</a><a href="#" >袁泽</a><a href="#" >周晓丽</a>
			</span></p>
            <div class="sns">
				<span>关注我们： </span><a href="#" class="login_sina">新浪微博 </a><a href="#" class="login_qq">腾讯微博</a>
				<a href="#" title="360绿色网站"><img src="http://trust.360.cn/img.php?sn=5229&id=5" border="0" /></a> 
			<!-- WPA Button Begin -->
		<!-- WPA Button END -->
			</div>
		</div>
	</div>
</div>
<!-- footer end -->

</body>
</html>

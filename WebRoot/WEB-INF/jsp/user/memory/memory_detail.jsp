<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh"><!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>旅游记忆 | 驴友网</title>
        <meta name="keywords" content="旅游社交，在旅途中享受激情与欢乐" />
        <meta name="description" content="旅游社交，在旅途中享受激情与欢乐"/>
        <link rel="shortcut icon" href="../favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/css_user/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/css_user/boxy,jquery.fancybox-1.3.4.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/css_user/huidong.css">
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
                     <c:if test="${userName==null}">
                    <li style="float:right"><a href="${pageContext.request.contextPath}/toregister" class="btn_reg">注册</a></li>
                    <li  style="float:right"><a href="${pageContext.request.contextPath}/tologin"  id="top-nav-login" class="btn_login">登录</a></li>
					</c:if>
					<c:if test="${userName!=null}">
					<li style="float:right"><a href="${pageContext.request.contextPath}/user/logout">注销</a></li>                                        
					<li style="float:right"><a href="#">好友申请（0）</a>&nbsp;&nbsp;&nbsp;</li>
					<li style="float:right"><a href="#">站内信（0）</a>&nbsp;&nbsp;&nbsp;</li>
					<li style="float:right"><a href="${pageContext.request.contextPath}/user/detail?userName=${userName}">${userName}</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
                	</c:if>
                </ul>
            </div>
        </div>

        <ul class="dropdown">
            <li>
                <a href="${pageContext.request.contextPath}/notice/list2" >首页</a>
            </li>
            <li class="current">
                <a href="${pageContext.request.contextPath}/tomemory">旅游记忆</a>
            </li>
            <li>
				<a href="${pageContext.request.contextPath}/totraveller">结伴游</a>
			</li>
            <li>
				<a href="${pageContext.request.contextPath}/park/queryAllParks">景点攻略</a>
			</li>
		</ul>
				 
		<div class="navSearch">
			<form action="${pageContext.request.contextPath}/memory/list1" method="get" id="searchForm" target="_blank">
				<input name="title" type="text" class="top-search-input" id="searchKey" value=<c:if test="${title==null or title==''}">"搜索旅游记忆"</c:if><c:if test="${title!=null}">"${title}"</c:if> maxlength="50" autocomplete="off"/>
                <input name="" type="submit" value="搜索" class="search_btn">
            </form>
			<div id="keyword_tip_content"></div>
		</div>
	</div>
</div>

<div id="container">
	<div class="ui-box fn-clear">
			<p><img src="${basePath}${m.photo}" style="height:200px; width:300px; float:left; padding-right:5px;" >
			&nbsp;&nbsp;&nbsp;&nbsp;标题：${m.title}<br /><br />
			&nbsp;&nbsp;&nbsp;&nbsp;类别：${m.memoryType}&nbsp;&nbsp;&nbsp;&nbsp;发布者：${m.userName}&nbsp;&nbsp;&nbsp;&nbsp;发布时间：<fmt:formatDate value="${m.submitTime }" pattern="yyyy-MM-dd hh:mm"/><br /><br />
			&nbsp;&nbsp;&nbsp;&nbsp;内容：${m.content}</p>
	</div>
	
	<div class="ui-box fn-clear">
		<div id="comment" class="comment cnt-box fn-clear">
			<h2>发表评论</h2>
			<div class="comment_headPic fn-left">
				<a href="#"><img width="75" height="75" alt="i闲逛" src="${pageContext.request.contextPath}/statics/images/images_user/default.jpg">	</a>
			</div>
			<div class="comment_info fn-right">
			<div class="cont fn-clear">
				<form action="${pageContext.request.contextPath}/memory/comment">
				<input type="hidden" name="userName" value="${userName}"/>
				<input type="hidden" name="travelMemoryId" value="${id}"/>
				<textarea class="talkBox" name="commentContent" id="comment_box" style="float:left" required></textarea>
				<c:if test="${userName!=null}">
				<input type="submit" class="sendBtn" value="评论">
				</c:if>
				<c:if test="${userName==null}">
				<input type="button" class="sendBtn" value="评论">
				</c:if>
				</form>
			</div>
			</div>
		</div>				
	</div>
	
	<div class="mainWrap wide-wrap fn-clear">
		<div class="main">
			<!--comments-->
			<div id="comment" class="comment cnt-box fn-clear">
				<h2>所有评论</h2>
					<ul id="comment-list" class="comment-list">
					<c:forEach items="${page.list}" var="n">
						<li class="fn-clear">
							<div class="comment_headPic fn-left">
								<a href="#"><img width="75" height="75" alt="i闲逛" src="${pageContext.request.contextPath}/statics/images/images_user/default.jpg"> </a>
							</div>
							<div class="comment_info fn-right">
								<p>
									<a class="comment_user" href="#"> ${n.userName}</a><fmt:formatDate value="${n.commentTime }" pattern="yyyy-MM-dd hh:mm"/> 
								</p>
								<div class="comment_box">
									<div class="SA">
										<em>◆</em><span>◆</span>
                                    </div>
									<div class="comment_cnt">${n.commentContent} <a href='#' >#一起玩旅游圈之试玩团心声#</a> 
                                            
                                    </div>
                                </div>
                            </div>
                        </li>
                        </c:forEach>
						<%--<li class="fn-clear">
							<div class="comment_headPic fn-left">
								<a href="#"><img width="75" height="75" alt="i闲逛" src="${pageContext.request.contextPath}/statics/images/images_user/default.jpg"> </a>
							</div>
							<div class="comment_info fn-right">
								<p>
									<a class="comment_user" href="#"> i闲逛</a>03月15日 23:54
								</p>
								<div class="comment_box">
									<div class="SA">
										<em>◆</em><span>◆</span>
                                    </div>
									<div class="comment_cnt">对风车岛倾心已久，憧憬着在蓝天、白云、大海、风车中尽情嬉戏，用相机框出最唯美的镜头。日落十分，坐在沙滩上，静静的享受着海风拂面，放空一切，慢慢地发呆的时光。 <a href='#' >#一起玩旅游圈之试玩团心声#</a> 
                                            
                                    </div>
                                </div>
                            </div>
                        </li>
						<li class="fn-clear">
							<div class="comment_headPic fn-left">
								<a href="#"><img width="75" height="75" alt="i闲逛" src="${pageContext.request.contextPath}/statics/images/images_user/default.jpg"> </a>
							</div>
							<div class="comment_info fn-right">
								<p>
									<a class="comment_user" href="#"> i闲逛</a>03月15日 23:54
								</p>
								<div class="comment_box">
									<div class="SA">
										<em>◆</em><span>◆</span>
                                    </div>
									<div class="comment_cnt">对风车岛倾心已久，憧憬着在蓝天、白云、大海、风车中尽情嬉戏，用相机框出最唯美的镜头。日落十分，坐在沙滩上，静静的享受着海风拂面，放空一切，慢慢地发呆的时光。 <a href='#' >#一起玩旅游圈之试玩团心声#</a> 
                                            
                                    </div>
                                </div>
                            </div>
                        </li>
						<li class="fn-clear">
							<div class="comment_headPic fn-left">
								<a href="#"><img width="75" height="75" alt="i闲逛" src="${pageContext.request.contextPath}/statics/images/images_user/default.jpg"> </a>
							</div>
							<div class="comment_info fn-right">
								<p>
									<a class="comment_user" href="#"> i闲逛</a>03月15日 23:54
								</p>
								<div class="comment_box">
									<div class="SA">
										<em>◆</em><span>◆</span>
                                    </div>
									<div class="comment_cnt">对风车岛倾心已久，憧憬着在蓝天、白云、大海、风车中尽情嬉戏，用相机框出最唯美的镜头。日落十分，坐在沙滩上，静静的享受着海风拂面，放空一切，慢慢地发呆的时光。 <a href='#' >#一起玩旅游圈之试玩团心声#</a> 
                                            
                                    </div>
                                </div>
                            </div>
                        </li>
					--%></ul>
					
					<!--分页-->
					<div class="no-pages cf">
						<c:if test="${page.pageNo>1}">
    			<a href="${pageContext.request.contextPath}/memory/detail2?id=${id}&pageNo=1">首页</a>
    			<a href="${pageContext.request.contextPath}/memory/detail2?id=${id}&pageNo=${page.pageNo-1}">上一页</a>
    			</c:if>
    			<c:if test="${page.pageNo<=1}">
				<a>首页</a>
				<a>上一页</a>
				</c:if>
				<c:if test="${page.pageNo<page.totalPageCount}">
    			<a href="${pageContext.request.contextPath}/memory/detail2?id=${id}&pageNo=${page.pageNo+1}">下一页</a>
    			<a href="${pageContext.request.contextPath}/memory/detail2?id=${id}&pageNo=${page.totalPageCount}">末页</a>
    			</c:if>
				<c:if test="${page.pageNo>=page.totalPageCount}">
				<a>下一页</a>
				<a>末页</a>
				</c:if>
    			第${page.pageNo}页/共${page.totalPageCount}页</div>
					</div>
				
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
				<p><span>版权所有TCJC056班</span><br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>周梨香</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>王硕</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>汪树平</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>王馨德</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>秦川</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>张京</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>程杰</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</p>
				<%--<div class="sns">
					<span>关注我们： </span><a href="#" class="login_sina">新浪微博 </a><a href="#" class="login_qq">腾讯微博</a>
					<a href="#" title="360绿色网站"><img src="http://trust.360.cn/img.php?sn=5229&id=5" border="0" /></a> 
				<!-- WPA Button Begin -->
			<!-- WPA Button END -->
				</div>
			--%></div>
		</div>
	</div>
	<!-- footer end -->
    </body>
</html>
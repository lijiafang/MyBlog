<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="model.*" %>
<%@page import="java.io.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

ArrayList al=(ArrayList)request.getAttribute("log");
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>李佳芳的个人博客-心情小记</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<meta name="keywords" content="李佳芳,个人博客,晨昏下,css3,html5" />
	<meta name="description" content="这是一个有关个人网站，仅供学习" />

	 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/feeling.css">
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/readMore.js"></script>
	
<style type="text/css">

</style>
  </head>
  
  <body>
     <header>
	<div class="top">
	</div>
	<div class="center">
		<div class="logo">
			<h1>晨&昏下</h1>
		</div>
		 <nav id="nav">
		   <ul>
		    <li><a href="servlet/LogController?type=homepage">网站首页</a></li>
		    <li><a href="aboutMe.html">我的故事</a></li>
		    <li><a href="servlet/LogController?type=show&category=feeling">心情小记</a></li>
		    <li><a href="servlet/LogController?type=show&category=study">技术笔记</a></li>
		    <li><a href="servlet/MessageController?type=show">留言板</a></li> 
		   </ul>
		   
		 </nav>
	 	<div class="line"></div>
	 	
	 	
 </div>
 <div class="animation">
	  		<div class="bar"></div>
		  	<ul>
		  		<li class="n1"><p>初春</p></li>
		  		<li class="n2"><p>仲夏</p></li>
		  		<li class="n3"><p>秋半</p></li>
		  		<li class="n4"><p>冬已</p></li>
		  	</ul>
	  </div>
</header>
<article>
	<div class="t_nav">
		<span>你像一把刀子把我雕刻的如此美丽，我将用余生的精彩感谢你的给的痛</span>
		<a href="servlet/LogController?type=homepage">网站首页</a>
		<a href="#" class="current">心情小记</a>
	</div>
	<section class="section">
		
		<ul class="content">
		<%
			for(int i=(al.size()-1);i>=0;i--){
			MyLog m=(MyLog)al.get(i);
		 %>
			<li>
				<h2><%=m.getTitle() %></h2>
				<a class="more_page" id="more<%=i %>">View More</a>
				<form id="form<%=i %>" action="servlet/LogController?type=detail" method="post"></form>
				<input type="hidden" value="<%=m.getTitle() %>" name="title" form="form<%=i %>"/>
				<input type="hidden" value="<%=m.getTheme() %>" name="theme" form="form<%=i %>"/>
				<input type="hidden" value="<%=m.getTime() %>" name="time" form="form<%=i %>"/>
				<input type="hidden" value="<%=basePath %>log/<%=m.getLog() %>" id="logTxt" name="logTxt" form="form<%=i %>"/>
				<%
					String pathName=basePath+"log/"+m.getLog();
					
					
					//File file=new File(pathName);
					URL url=new URL(pathName);
					URLConnection conn=url.openConnection();
					
				    
					BufferedReader reader=null;
					String tempString=null;
					int line=1;
					try{
						reader=new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
						while((tempString=reader.readLine())!=null && line<=4){
							%>
							<p ><%=tempString %></p>
							<% 
							
							line++;
						}
						reader.close();
					}catch(Exception e){
						e.printStackTrace();
					}finally{
						if(reader!=null){
							try{
								reader.close();
							}catch(Exception e){
								e.printStackTrace();
							}
						}
					}
					
					
				 %>
				<p>......</p>
				<p class="time"><%=m.getTime() %></p>
			</li>
			<%
			}
			 %>
			
			
		</ul>
	</section>
	<aside>
		<ul>
			<pre>
姓名：李佳芳

 ~a girl~
 
年龄：。。永远18岁。。

职业：学生

学校：西安电子科技大学

QQ：1031942456

邮箱：你懂得，QQ邮箱

Github账号：<a href="https://github.com/lijiafang">https://github.com/lijiafang</a>
				
---该网站全部代码以上传至该github账号---
			</pre>
		</ul>
	</aside>
</article>
<footer>
<div class="footer_badge"><p>晨 &昏下</p></div>

<div class="footer_bottom">
	<div class="copyrights">study hard & play hard</div>
	 <div class="footer_links">
		 <ul>
		    <li><a href="servlet/LogController?type=homepage">网站首页</a></li>
		    <li><a href="aboutMe.html">我的故事</a></li>
		    <li><a href="#">心情小记</a></li>
		    <li><a href="servlet/LogController?type=show&category=study">技术笔记</a></li>
		    <li><a href="servlet/MessageController?type=show">留言板</a></li> 
		  </ul>
	 </div>
</div>
</footer>
<script type="text/javascript">
window.onload=function(){
		showDetail();
	};
</script>
  </body>
</html>

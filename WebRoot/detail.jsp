<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="model.*" %>
<%@page import="java.io.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>李佳芳的个人博客-零零总总</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<meta name="keywords" content="李佳芳,个人博客,晨昏下,css3,html5" />
	<meta name="description" content="这是一个有关个人网站，仅供学习" />

	
	 <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/detail.css">

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
		<span>哈哈，是不是蛮文艺的</span>
		<a href="servlet/LogController?type=homepage">网站首页</a>
		<a href="#" class="current">零零总总</a>
	</div>
	<section class="section">
	<div id="content">
	   <h2><%=request.getAttribute("title") %></h2>
		<span class="theme">主题：<%=request.getAttribute("theme")  %></span>
		<%
					String pathName=request.getAttribute("logTxt").toString();
					System.out.println(pathName);
					
					//File file=new File(pathName);
					URL url=new URL(pathName);
					URLConnection conn=url.openConnection();
					
				    
					BufferedReader reader=null;
					String tempString=null;
					int line=1;
					try{
						reader=new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
						while((tempString=reader.readLine())!=null){
							%>
							<p class="logTxt"><%=tempString %></p>
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
		
		<span class="time"><%=request.getAttribute("time") %></span>
		</div>
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
		    <li><a href="servlet/LogController?type=show&category=feeling">心情小记</a></li>
		    <li><a href="servlet/LogController?type=show&category=study">技术笔记</a></li>
		    <li><a href="servlet/MessageController?type=show">留言板</a></li> 
		  </ul>
	 </div>
</div>
</footer>
  </body>
</html>

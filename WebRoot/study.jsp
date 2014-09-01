<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="model.*" %>
<%@page import="java.io.*" %>
<%@page import="model.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

ArrayList al=(ArrayList)request.getAttribute("log");
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>��ѷ��ĸ��˲���-�����ʼ�</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<meta name="keywords" content="��ѷ�,���˲���,������,css3,html5" />
	<meta name="description" content="����һ���йظ�����վ������ѧϰ" />

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/feeling.css">
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/readMore.js"></script>
  </head>
  
  <body>
   <header>
	<div class="top">
	</div>
	<div class="center">
		<div class="logo">
			<h1>��&����</h1>
		</div>
		 <nav id="nav">
		   <ul>
		  <li><a href="servlet/LogController?type=homepage">��վ��ҳ</a></li>
		    <li><a href="aboutMe.html">�ҵĹ���</a></li>
		    <li><a href="servlet/LogController?type=show&category=feeling">����С��</a></li>
		    <li><a href="#">�����ʼ�</a></li>
		    <li><a href="servlet/MessageController?type=show">���԰�</a></li> 
		   </ul>
		   
		 </nav>
	 	<div class="line"></div>
	 	
	 	
 </div>
 <div class="animation">
	  		<div class="bar"></div>
		  	<ul>
		  		<li class="n1"><p>����</p></li>
		  		<li class="n2"><p>����</p></li>
		  		<li class="n3"><p>���</p></li>
		  		<li class="n4"><p>����</p></li>
		  	</ul>
	  </div>
</header>
<article>
	<div class="t_nav">
		<span>ֽ�ϵ����վ�ǳ����֪����Ҫ����</span>
		<a href="servlet/LogController?type=homepage">��վ��ҳ</a>
		<a href="#" class="current">�����ʼ�</a>
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
��������ѷ�

 ~a girl~
 
���䣺������Զ18�ꡣ��

ְҵ��ѧ��

ѧУ���������ӿƼ���ѧ

QQ��1031942456

���䣺�㶮�ã�QQ����

Github�˺ţ�<a href="https://github.com/lijiafang">https://github.com/lijiafang</a>
				
---����վȫ���������ϴ�����github�˺�---
			</pre>
		</ul>
	</aside>
</article>
<footer>
<div class="footer_badge"><p>�� &����</p></div>

<div class="footer_bottom">
	<div class="copyrights">study hard & play hard</div>
	 <div class="footer_links">
		 <ul>
		    <li><a href="servlet/LogController?type=homepage">��վ��ҳ</a></li>
		    <li><a href="aboutMe.html">�ҵĹ���</a></li>
		    <li><a href="servlet/LogController?type=show&category=feeling">����С��</a></li>
		    <li><a href="#">�����ʼ�</a></li>
		    <li><a href="servlet/MessageController?type=show">���԰�</a></li> 
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

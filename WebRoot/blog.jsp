<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="model.*" %>
<%@page import="java.io.*" %>
<%@page import="model.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList al=(ArrayList)request.getAttribute("log");
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>李佳芳的个人博客</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<meta name="keywords" content="李佳芳,个人博客,晨昏下,css3,html5" />
	<meta name="description" content="这是一个有关个人网站，仅供学习" />

<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<link href="css/myStyles.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/readMore.js"></script>
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
		   <li><a href="#">网站首页</a></li>
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
<div class="main_content">
   <div class="book">
	      <section class="welcome_text">
	        <h2>Welcome to my life</h2>
	        <ul>
		         <li>&nbsp;如何让你遇见我，在我最美丽的时刻 </li>
		       	 <li>&nbsp;&nbsp;为这，我已在佛前 求了五百年，求佛让我们结一段尘缘</li>
		       	 <li>&nbsp;佛于是把我化作一棵树，长在你必经的路边</li>
		       	 <li>&nbsp;&nbsp;&nbsp;阳光下慎重地开满了花，朵朵都是我前世的盼望</li>
		       	 <li>&nbsp;&nbsp;当你走近，请你细听，那颤抖的叶是我等待的热情</li>
		       	 <li>&nbsp;而当你终于无视地走过，在你身后落了一地的</li>
		       	 <li>&nbsp;&nbsp;&nbsp;亲爱的，那不是花瓣</li>
		       	 <li>&nbsp;&nbsp;&nbsp;&nbsp;是我凋零的心</li>
		    </ul>
	        <a  class="more">一棵开花的树</a>
	     </section>
	      <div id="coin-slider">
	    	<ul id="slider">
	    		<li><a href="#"><img src="images/my1.png" ></a></li>
	    		<li><a href="#"><img src="images/my2.png" ></a></li>
	    		<li><a href="#"><img src="images/my3.png" ></a></li>
	    	</ul>
	     </div>
   </div>  
   <div class="content_left">
     <div class="about_text">
       <h2>之于我</h2>
       <a class="photo_thumb"><img src="images/self.png"></a>
       <p>人生没有绝对的公平，而是相对公平。在一个天平上，你得到越多，势必要承受更多，每一个看似低的起点，都是通往更高峰的必经之路。让自己心情更平和一点，更豁达一点，对身边的过错淡然，让自己更宽容一点，乐观，阳光。幸福不是得到的多，而是要求的少，计较的少.我们总是浪费时间寻找完美的爱人，却未曾努力营造一份完美的爱。</p>
       <a href="aboutMe.html" class="more_me">view more</a>
     </div>
     <div class="photos">
       <h2>自恋是一种态度</h2>
	     <a class="photo_thumb"><img src="images/self1.png"></a>
	     <a class="photo_thumb"><img src="images/self2.png"></a>
	     <a class="photo_thumb_last"><img src="images/self3.png"></a>
	     <a class="more_me" href="aboutMe.html">view more</a>
     </div>   
   </div>
   <div class="content_right">
     <h2>最近更新</h2>
    	<div class="content">
    	<%
			for(int i=(al.size()-1);i>=0;i--){
			MyLog m=(MyLog)al.get(i);
		 %>
			<section>
		     <time class="post_date">
		     <%
		     	SimpleDateFormat format=new SimpleDateFormat("y/M/d HH:mm:ss");
		     	Date date=format.parse(m.getTime());
		     	Calendar cl=Calendar.getInstance();
		     	cl.setTime(date);
		     	int month=cl.get(Calendar.MONTH)+1;
		     	int day=cl.get(Calendar.DAY_OF_MONTH);
		      %>
		       <span class="day"><%=day %></span>
		       <span class="month"><%=month %>月</span>
		     </time>
     		<div class="post_content">
				<h3><%=m.getTitle() %></h3>
				<span class="post_info">主题：<%=m.getTheme() %></span>
				<form id="form<%=i %>" action="servlet/LogController?type=detail" method="post"></form>
				<input type="hidden" value="<%=m.getTitle() %>" name="title" form="form<%=i %>"/>
				<input type="hidden" value="<%=m.getTheme() %>" name="theme" form="form<%=i %>"/>
				<input type="hidden" value="<%=m.getTime() %>" name="time" form="form<%=i %>"/>
				<input type="hidden" value="<%=basePath %>log/<%=m.getLog() %>" id="logTxt" name="logTxt" form="form<%=i %>"/>
				<%
					String pathName=basePath+"log/"+m.getLog();
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
				<a class="more_page" id="more<%=i %>">View More</a>
				 </div>
			</section>
				 <%
				 }
				  %>
		</div>
   </div>
</div>
<footer>
<div class="footer_badge"><p>晨 &昏下</p></div>

<div class="footer_bottom">
	<div class="copyrights">study hard & play hard</div>
	 <div class="footer_links">
		 <ul>
		    <li><a href="#">网站首页</a></li>
		    <li><a href="aboutMe.html">我的故事</a></li>
		    <li><a href="servlet/LogController?type=show&category=feeling">心情小记</a></li>
		    <li><a href="servlet/LogController?type=show&category=study">技术笔记</a></li>
		    <li><a href="servlet/MessageController?type=show">留言板</a></li> 
		  </ul>
	 </div>
</div>
</footer>
<script type="text/javascript">
    	window.onload=function(){
    	showDetail();
    		slider(1);
    		var i=1;
    		setInterval(function(){
    			if(i==3){
    				i=1;
    				slider(i);
    			}else{
    				i++;
    				slider(i);
    			}
    		},2000);
    		
    		var btn=$("#sliderBtn");
    		btn.mouseover(function(e){
    			var all=$("#sliderBtn li");
    			for(var j=0;j<all.length;j++){
    				if(e.target==all[j]){
    					all[j].style.background="rgba(12,12,12,0.3)";
    				}else{
    					all[j].style.background="rgba(12,12,12,0.1)";
    				}
    			}
    			slider(e.target.innerHTML);
    		});
    		btn.click(function(e){
    			slider(e.target.innerHTML);
    		});
    	};
    	function slider(i){
	    	for(var m=1;m<4;m++){
	    		if(m==i){
	    			$('#slider li:nth-child('+m+')').css("display","block");
	    		}else{
	    			$('#slider li:nth-child('+m+')').css("display","none");
	    		}
	    	}
    	}
    	
    </script>
</body>
</html>
  

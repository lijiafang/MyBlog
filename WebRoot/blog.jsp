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
    <title>��ѷ��ĸ��˲���</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<meta name="keywords" content="��ѷ�,���˲���,������,css3,html5" />
	<meta name="description" content="����һ���йظ�����վ������ѧϰ" />

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
			<h1>��&����</h1>
		</div>
		 <nav id="nav">
		   <ul>
		   <li><a href="#">��վ��ҳ</a></li>
		    <li><a href="aboutMe.html">�ҵĹ���</a></li>
		    <li><a href="servlet/LogController?type=show&category=feeling">����С��</a></li>
		    <li><a href="servlet/LogController?type=show&category=study">�����ʼ�</a></li>
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
<div class="main_content">
   <div class="book">
	      <section class="welcome_text">
	        <h2>Welcome to my life</h2>
	        <ul>
		         <li>&nbsp;������������ң�������������ʱ�� </li>
		       	 <li>&nbsp;&nbsp;Ϊ�⣬�����ڷ�ǰ ��������꣬��������ǽ�һ�γ�Ե</li>
		       	 <li>&nbsp;�����ǰ��һ���һ������������ؾ���·��</li>
		       	 <li>&nbsp;&nbsp;&nbsp;���������صؿ����˻�����䶼����ǰ��������</li>
		       	 <li>&nbsp;&nbsp;�����߽�������ϸ�����ǲ�����Ҷ���ҵȴ�������</li>
		       	 <li>&nbsp;�������������ӵ��߹��������������һ�ص�</li>
		       	 <li>&nbsp;&nbsp;&nbsp;�װ��ģ��ǲ��ǻ���</li>
		       	 <li>&nbsp;&nbsp;&nbsp;&nbsp;���ҵ������</li>
		    </ul>
	        <a  class="more">һ�ÿ�������</a>
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
       <h2>֮����</h2>
       <a class="photo_thumb"><img src="images/self.png"></a>
       <p>����û�о��ԵĹ�ƽ��������Թ�ƽ����һ����ƽ�ϣ���õ�Խ�࣬�Ʊ�Ҫ���ܸ��࣬ÿһ�����Ƶ͵���㣬����ͨ�����߷�ıؾ�֮·�����Լ������ƽ��һ�㣬�����һ�㣬����ߵĹ���Ȼ�����Լ�������һ�㣬�ֹۣ����⡣�Ҹ����ǵõ��Ķ࣬����Ҫ����٣��ƽϵ���.���������˷�ʱ��Ѱ�������İ��ˣ�ȴδ��Ŭ��Ӫ��һ�������İ���</p>
       <a href="aboutMe.html" class="more_me">view more</a>
     </div>
     <div class="photos">
       <h2>������һ��̬��</h2>
	     <a class="photo_thumb"><img src="images/self1.png"></a>
	     <a class="photo_thumb"><img src="images/self2.png"></a>
	     <a class="photo_thumb_last"><img src="images/self3.png"></a>
	     <a class="more_me" href="aboutMe.html">view more</a>
     </div>   
   </div>
   <div class="content_right">
     <h2>�������</h2>
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
		       <span class="month"><%=month %>��</span>
		     </time>
     		<div class="post_content">
				<h3><%=m.getTitle() %></h3>
				<span class="post_info">���⣺<%=m.getTheme() %></span>
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
<div class="footer_badge"><p>�� &����</p></div>

<div class="footer_bottom">
	<div class="copyrights">study hard & play hard</div>
	 <div class="footer_links">
		 <ul>
		    <li><a href="#">��վ��ҳ</a></li>
		    <li><a href="aboutMe.html">�ҵĹ���</a></li>
		    <li><a href="servlet/LogController?type=show&category=feeling">����С��</a></li>
		    <li><a href="servlet/LogController?type=show&category=study">�����ʼ�</a></li>
		    <li><a href="servlet/MessageController?type=show">���԰�</a></li> 
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
  

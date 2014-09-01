<%@page import="model.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

ArrayList al=(ArrayList)request.getAttribute("message");
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>李佳芳的个人博客-留言板</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<meta name="keywords" content="李佳芳,个人博客,晨昏下,css3,html5" />
	<meta name="description" content="这是一个有关个人网站，仅供学习" />

	<link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/message.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/main.js"></script>

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
		    <li><a href="#">留言板</a></li> 
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
		<span>晓镜但愁云鬓改，夜吟应觉月光寒。蓬山此去无多路，青鸟殷勤为探看。</span>
		<a href="servlet/LogController?type=homepage">网站首页</a>
		<a href="#" class="current">留言板</a>
	</div>
	<section class="section">
		 <form class="message" id="message">
		    	<div class="relation">
			    	<input type="radio" value="visitor" name="who"/><span>匿名</span>
			    	<input type="radio" value="friend" name="who"/><span>好友</span>
		    	</div>
		    	<p>你还可以输入<span id="number">500</span>个字</p>
		    	<textarea placeholder="为了帮助大家一起学英语，请用英语给我留言，中文留的话会出现火星文哦~~" name="message" id="messageTxt"></textarea>
		    	<span id="relationInfo">请点击“好友”填写您的昵称，或者点击“匿名”留言</span>
		    	<span id="textInfo">请输入内容后留言</span>
		    	<button type="button" id="submit">留言</button>
		  </form>
		  <ul class="content">
		  <%
		  	for(int i=(al.size()-1);i>=0;i--){
		  		Message message=(Message)al.get(i);
		   %>
			  <li>
			  <%
			  if("null".equals(message.getFriendName())){
			   %>
			   <p class="name">神秘好友对我说:</p>
			   <%
			   }else{
			    %>
			   <p class="name"><%=message.getFriendName() %>对我说:</p>
			   <%
			   	}
			    %>
			   <p>&nbsp;&nbsp;&nbsp;<%=message.getMessage() %></p>
			   <p class="time">Ta留言的时间:<%=message.getTime() %></p>
			  </li>
			  <%
			  }
			   %>
		  </ul>
	</section>
	<aside>
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
		    <li><a href="#">留言板</a></li> 
		  </ul>
	 </div>
</div>
</footer>

<script type="text/javascript">
	   	window.onload=function(){
	   		who();
	   		leaveMessage();
	   		count();
	   	};
	   	function who(){
	   		var who=document.getElementsByClassName("relation")[0];
	   		who.addEventListener("click",function(e){
	   			var text=document.getElementsByClassName("friendName")[0];
	   			if(e.target.value=="friend"){
	   			
	   				if(text==undefined){
		   				var friendName=document.createElement("input");
		   				friendName.setAttribute("id","friendName");
		   				friendName.setAttribute("type","text");
		   				friendName.setAttribute("name","friendName");
		   				friendName.className="friendName";
		   				friendName.setAttribute("placeholder","请告诉我你的昵称~");
		   				friendName.setAttribute("form","message");
		   				who.appendChild(friendName);
		   			}
	   			}
	   			if(e.target.value=="visitor"){
	   				if(text!=undefined){
	   					who.removeChild(text);
	   				}
	   			}
	   		},false);
	   	}
	   	function leaveMessage(){
	  
	   		var btn=document.getElementById("submit");
	   		btn.addEventListener("click",function(e){
	   		
	   			var who=document.getElementsByName("who");
	   			for(var i=0;i<who.length;i++){
	   				if(who[i].checked){
	   					break;
	   				}
	   			}
	   			if(i==who.length){
	   				myAlert("提示","请点击“好友”填写您的昵称，或者点击“匿名”留言");
	   				return;
	   				//document.getElementById("relationInfo").style.display="inline";
	   			}
	   			/* else{
	   				document.getElementById("relationInfo").style.display="none";
	   			} */
	   			var text=document.getElementsByTagName("textarea")[0];
	   			
	   			if(text.value==""){
	   				myAlert("提示","请输入内容后留言");
	   				return;
	   				//document.getElementById("textInfo").style.display="inline";
	   			}/* else{
	   				document.getElementById("textInfo").style.display="none";
	   			} */
	   			
	   			var option={
	   				url:"servlet/MessageController?type=add",
	   				type:"post",
	   				dataType:"text",
	   				data:$("#message").serialize(),
	   				success:function(data){
	   				
	   					if(data!=null){
	   						myAlert("","留言成功");
	   						var messageTxt=text.value;
	   						var friendName=document.getElementById("friendName");
	   						
	   						var newMessage=document.createElement("li");
	   						newMessage.setAttribute("id","newMessage");
	   						
	   						var newName=document.createElement("p");
	   						newName.setAttribute("id","newName");
	   						newName.className="name";
	   						if (friendName == null) {
	   						
	   							newName.innerHTML="神秘好友对我说:";
	   						}else{
	   							newName.innerHTML=friendName.value+"对我说:";
	   							friendName.value="";
	   						}
	   						
	   						var newTxt=document.createElement("p");
	   						newTxt.innerHTML=messageTxt;
	   						text.value="";
	   						
	   						var newTime=document.createElement("p");
	   						newTime.className="time";
	   						newTime.innerHTML=data;
	   						
	   						var content=document.getElementsByClassName("content")[0];
	   						var first=content.firstChild;
	   						content.insertBefore(newMessage,first);
	   						
	   						var newLi=document.getElementById("newMessage");
	   						newLi.appendChild(newName);
	   						newLi.appendChild(newTxt);
	   						newLi.appendChild(newTime);
	   						
	   						
	   						
	   						
	   					}else{
	   						myAlert("","系统繁忙，请稍后再试");
	   					}
	   				}
	   			};
	   			$.ajax(option);
	   		},false);
	   		
	   	}
	   
		function count(){
	   		var text=document.getElementsByTagName("textarea")[0];
	   		var number=document.getElementById("number");
	   		text.addEventListener("keydown",function(){
	   			var value=text.value;
	   			var num=1;
	   			for(var i=0;i<value.length;i++){
	   				if(value.charCodeAt(i)>255){
	   					num+=2;
	   				}else{
	   					num+=1;
	   				}
	   			}
	   			number.innerHTML=(500-num)+"";
	   		},false);
	   	}
	   </script>
  </body>
</html>

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
    <title>��ѷ��ĸ��˲���-���԰�</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<meta name="keywords" content="��ѷ�,���˲���,������,css3,html5" />
	<meta name="description" content="����һ���йظ�����վ������ѧϰ" />

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
			<h1>��&����</h1>
		</div>
		 <nav id="nav">
		   <ul>
		  <li><a href="servlet/LogController?type=homepage">��վ��ҳ</a></li>
		    <li><a href="aboutMe.html">�ҵĹ���</a></li>
		    <li><a href="servlet/LogController?type=show&category=feeling">����С��</a></li>
		    <li><a href="servlet/LogController?type=show&category=study">�����ʼ�</a></li>
		    <li><a href="#">���԰�</a></li> 
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
		<span>�����������޸ģ�ҹ��Ӧ���¹⺮����ɽ��ȥ�޶�·����������Ϊ̽����</span>
		<a href="servlet/LogController?type=homepage">��վ��ҳ</a>
		<a href="#" class="current">���԰�</a>
	</div>
	<section class="section">
		 <form class="message" id="message">
		    	<div class="relation">
			    	<input type="radio" value="visitor" name="who"/><span>����</span>
			    	<input type="radio" value="friend" name="who"/><span>����</span>
		    	</div>
		    	<p>�㻹��������<span id="number">500</span>����</p>
		    	<textarea placeholder="Ϊ�˰������һ��ѧӢ�����Ӣ��������ԣ��������Ļ�����ֻ�����Ŷ~~" name="message" id="messageTxt"></textarea>
		    	<span id="relationInfo">���������ѡ���д�����ǳƣ����ߵ��������������</span>
		    	<span id="textInfo">���������ݺ�����</span>
		    	<button type="button" id="submit">����</button>
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
			   <p class="name">���غ��Ѷ���˵:</p>
			   <%
			   }else{
			    %>
			   <p class="name"><%=message.getFriendName() %>����˵:</p>
			   <%
			   	}
			    %>
			   <p>&nbsp;&nbsp;&nbsp;<%=message.getMessage() %></p>
			   <p class="time">Ta���Ե�ʱ��:<%=message.getTime() %></p>
			  </li>
			  <%
			  }
			   %>
		  </ul>
	</section>
	<aside>
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
		    <li><a href="servlet/LogController?type=show&category=study">�����ʼ�</a></li>
		    <li><a href="#">���԰�</a></li> 
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
		   				friendName.setAttribute("placeholder","�����������ǳ�~");
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
	   				myAlert("��ʾ","���������ѡ���д�����ǳƣ����ߵ��������������");
	   				return;
	   				//document.getElementById("relationInfo").style.display="inline";
	   			}
	   			/* else{
	   				document.getElementById("relationInfo").style.display="none";
	   			} */
	   			var text=document.getElementsByTagName("textarea")[0];
	   			
	   			if(text.value==""){
	   				myAlert("��ʾ","���������ݺ�����");
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
	   						myAlert("","���Գɹ�");
	   						var messageTxt=text.value;
	   						var friendName=document.getElementById("friendName");
	   						
	   						var newMessage=document.createElement("li");
	   						newMessage.setAttribute("id","newMessage");
	   						
	   						var newName=document.createElement("p");
	   						newName.setAttribute("id","newName");
	   						newName.className="name";
	   						if (friendName == null) {
	   						
	   							newName.innerHTML="���غ��Ѷ���˵:";
	   						}else{
	   							newName.innerHTML=friendName.value+"����˵:";
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
	   						myAlert("","ϵͳ��æ�����Ժ�����");
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

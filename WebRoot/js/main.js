
	function myAlert(strTitle,strContent){
		
		var bgDiv=document.createElement("div");
		bgDiv.style.width=screen.width+"px";
		bgDiv.style.height=screen.height+"px";
		bgDiv.className="bgDiv";
 		
		var msgObj=document.createElement("div");
		 msgObj.setAttribute("id","msgDiv");
		 msgObj.className="msgDiv";
 		
 		var title=document.createElement("h4");
 		title.setAttribute("id","msgTitle");
 		title.className="msgTitle";
 		title.title = "click to close";
 		title.innerHTML=strTitle;
	 	title.onclick=function(){
			 document.getElementById("msgDiv").removeChild(title);
			 document.body.removeChild(bgDiv);
		 	 document.body.removeChild(msgObj);
		 };
		 
		 var close=document.createElement("span");
		 close.innerHTML="close";
		 close.className="closeTxt";
		 
		 var txt=document.createElement("p");
	 	 txt.style.margin="1em 0";
		 txt.setAttribute("id","msgTxt");
		 txt.innerHTML=strContent;
		 
		 document.body.appendChild(bgDiv);
	 	document.body.appendChild(msgObj);
	 	document.getElementById("msgDiv").appendChild(title);
	 	document.getElementById("msgTitle").appendChild(close);
	 	document.getElementById("msgDiv").appendChild(txt);
	}
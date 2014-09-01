var obj=null;
var As=document.getElementById('nav').getElementsByTagName('a');
if(As!=null){
obj = As[0];
for(i=1;i<As.length;i++){
	if(As[i].getAttribute("href")=="#"){
		obj=As[i];
	}
}
	/*if(window.location.href.indexOf(As[i].href)>=0)
		obj=As[i];
	}*/
obj.id='nav_current';
}

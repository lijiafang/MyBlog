
	function showDetail(){
		var content=document.getElementsByClassName("content")[0];
		content.addEventListener("click",function(e){
			if(e.target.tagName.toLowerCase()!="a"){
				return;
			}
			var btn=document.getElementsByClassName("more_page");
			for(var i in btn){
				if(e.target==btn[i]){
					document.getElementsByTagName("form")[i].submit();
				}
			}
		},false);
	}
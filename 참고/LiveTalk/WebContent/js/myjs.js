	function newtopic(){
		var ele = document.getElementById("addtopic");
		if(ele.style.display == "block") {
	    		ele.style.display = "none";
	  	}
		else {
			ele.style.display = "block";
		}
	}
	function getParam( name )
	{
	 name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
	 var regexS = "[\\?&]"+name+"=([^&#]*)";
	 var regex = new RegExp( regexS );
	 var results = regex.exec( window.location.href );
	 if( results == null )
	  return "";
	else
	 return results[1];
	}
	function deltalk( num, topic)
	{
		var form = document.getElementById("talk"+num);
		if(form.style.display == "none"){
			form.style.display = "inline";
			form.innerHTML += "<input type='password' name='password'>";
			form.innerHTML += "<input type='hidden' name='num' value='"+ num +"'>";
			form.innerHTML += "<input type='hidden' name='topic' value='" + topic + "'> ";
			form.innerHTML += "<input class='submit' type='submit' value='확인'>";
		}
		
	}
	function clearText(y){ 
		if (y.defaultValue==y.value) 
		y.value = "" 
	} 
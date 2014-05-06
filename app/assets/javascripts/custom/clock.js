jQuery.countdown = function(object){
	var otime = parseInt(object.time) || null;
	var newTime = parseInt(object.newTime)  || null;
	//�Ƿ�ѭ������ʱ ����һ��
	var circleTime = otime;
	//����ID
    var domid = typeof(object.id) == "string" ?  $("#"+object.id) : object.id;
    var tcircle = object.circle || 0;
    var tcallback = object.callback || null;
    var spe = object.spe || 0;
	if(!domid.size()){
		return false;
	}
	if(otime<0){
		otime = - otime;
		circleTime = - otime;
	}
    this._stopTimer = setInterval(function(){
		setCountDown(domid);
		},1000);

	function secondToDay(t){
		  if(t <= 0){
		  	return [0,0,0,0];
		  }else if(spe == 1){

		     return t;

		  }
		  else{
        	     var d=Math.floor(t / 86400);
        	     var h=Math.floor((t-d*86400)/3600);
        	     var m=Math.floor((t-d*86400-h*3600)/60);
        	     var s=Math.floor(t-d*86400-h*3600-m*60);
        	     return [d,h,m,s];
	         }
	}
//����ƴװ��HTML
	function returnHtml(s){
		if(s){
               if(spe == 1){

                        if(parseInt(s) == 0){

                             return '<span class="Tsecond">0</span>';
                        }else{
	    	              return '<span class="Tsecond">'+s+'</span>';
	    	          }
               } else{
                    s[0].toString();
					if(s[0].length < 3){
						s[0]=("0"+s[0]).slice(-2);
					}
                    s[1].toString();s[1]=("0"+s[1]).slice(-2);
                    s[2].toString();s[2]=("0"+s[2]).slice(-2);
                    s[3].toString();s[3]=("0"+s[3]).slice(-2);
					if(s[0].length < 3){
						return '<span>'+s[0].slice(0,1)+s[0].slice(-1)+"</span><b>天</b>"+'<span>'+s[1].slice(0,1)+s[1].slice(-1)+'</span><b>小时</b><span >'+s[2].slice(0,1)+s[2].slice(-1)+'</span><b>分钟</b><span>'+s[3].slice(0, 1)+s[3].slice(-1)+'</span><b>秒</b>';
					}else{
						return '<span>'+s[0]+"</span><b>天</b>"+'<span>'+s[1].slice(0,1)+s[1].slice(-1)+'</span><b>小时</b><span >'+s[2].slice(0,1)+s[2].slice(-1)+'</span><b>分钟</b><span>'+s[3].slice(0,1)+s[3].slice(-1)+'</span><b>秒</b>';
					}
			 }
	    }
	    else{
	  	s = ['00','00','00','00'];
		return '<span>'+s[0].slice(0,1)+s[0].slice(-1)+"</span><b>天</b>"+'<span >'+s[1].slice(0,1)+s[1].slice(-1)+'</span><b>小时</b><span>'+s[2].slice(0,1)+s[2].slice(-1)+'</span><b>分钟</b><span>'+s[3].slice(0,1)+s[3].slice(-1)+'</span><b>秒/b>';
	    }

	}

	function setCountDown(domid){
	    var s=secondToDay(--otime);

	    domid.html(returnHtml(s));
	    if(otime<=0){
	        if(tcallback){
	        	tcallback();
	        }
	    if (0 == tcircle){                   //�ж��Ƿ�ѭ����ʱ
		  	clearInterval(this._stopTimer);
		  	this._stopTimer = null;
		  	return;
	   }
	   else if(1 == tcircle){
	   	    if(!!newTime){
	   	    	    circleTime = newTime;
	   	    }
	  	    otime = circleTime;
	   }
	  else{
	  	   clearInterval(this._stopTimer);
	  	   this._stopTimer = null;
	  	   return;
	  }
	  }
	}
	return this;
}

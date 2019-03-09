      function handleDeleteArticle(aid,uid){
			  
    	  var flag = confirm("确定删除此记录？");
    	  if(flag){
	    	  $.post(
	    		  "/LostAndFound/me?method=handleDeleteArticle",
	    		  {
	    			  "aid":aid
	    		  },
	    		  function(data){ 
	    			  if(data.success){
	    				  // 重新经过servlet跳转，再跳回来此页面
	    			    window.location.href="/LostAndFound/me?method=getMyArticleListToPage&uid="+uid
	    			  }
	    		  },
	    		  "json"
	    	  );
    	  } 
      } // end of handleDeleteArticle()

      $('.confirmTakenBtn').on('click', function(){
    		var taken = $('input:radio[name="forConfirmTaken"]:checked').val();
    		var aid = $('.aid').val();
    		var uid = $('.uid').val();
    		if(taken == "1"){
    			// 取消认领
    			var takenFlag = confirm("取消认领？")
    			if(takenFlag){
    				$.post(
    				  "/LostAndFound/message?method=cancelOrderArticle",
    				  {
    					  "aid":aid
    				  },
    				  function(data){
    					  if(data.success){
    						  window.location.href="/LostAndFound/message?method=getInfoList&uid="+uid
    					  }
    				  },
    				  "json"
    				);
    			}
    		} else {
    			// 确定认领
    			var takenFlag = confirm("确定认领？")
    			if(takenFlag){
	    			var foundInfo = $('.foundInfo').val();
	    			if(foundInfo==""||foundInfo==null){
	    				$('.foundInfo').focus();
	    			}else{
	    				console.log('confirm..')
	    				$.post(
	    				  "/LostAndFound/message?method=confirmOrderArticle",
	    				  {
	    					  "aid":aid,
	    					  "foundInfo":foundInfo
	    				  },
	    				  function(data){
	    		        if(data.success){
	    		          window.location.href="/LostAndFound/message?method=getInfoList&uid="+uid
	    		        }
	    				  },
	    				  "json"
	    				);	    				
	    			}
    			} // end second if{}
    		} // end of first big else{}
    	}) // end of .confirmTakenBtn click 


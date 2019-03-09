<!--   <script type="text/javascript">
    $(function(){
    	/* 
    	在细节页面刷新，如果已经点击 确认 了，即使刷新也要显示此
    	已经成功的记录，就显示成功的提醒信息
    	已经预约领取的记录，显示预约领取的提醒信息
    	*/
      if($('.whatFlag').val()=='1' && $('.foundFlag').val()=='2'){
        $('.forSearchLoseInfo').css('display','block');         
      }else if($('.whatFlag').val()=='0' && $('.foundFlag').val()=='2'){
        $('.forSearchLoserInfo').css('display','block');                    
      }else if($('.whatFlag').val()=='0' && $('.foundFlag').val()=='0'){
    	  $('.forSearchLoserSuccessfully').css('display','block');
      }else if($('.whatFlag').val()=='1' && $('.foundFlag').val()=='0'){
    	  $('.forSearchLoseSuccessfully').css('display','block');    	  
      }
    	// 若是本人发布的，在本人的页面上，没有 我是失主？和 捡到失物？两个radio组，也没有提示信息
    	if($('.user_uid').val() == $('.article_uid').val()){
    		$('.radioCheckedLi').css('display','none');
    	}
    	// 拾到失物的radio确定按钮
    	$('input:radio[name="pickUpTheLose"]').on('change',function(){
    		var pickUpTheLose = $('input:radio[name="pickUpTheLose"]:checked').val();
    		if(pickUpTheLose == "0"){
    			$('.onfirmModal').css('display','block')
    			$('.modal-text').text('确定拾到失物？')
    		}
    	})
    	// 我是失主的radio确定按钮
    	$('input:radio[name="IamTheLoser"]').on('change',function(){
        var IamTheLoser = $('input:radio[name="IamTheLoser"]:checked').val();
        if(IamTheLoser == "0"){
          $('.onfirmModal').css('display','block')
          $('.modal-text').text('确定我是失主？')
        }
      })
      // 透明层中的取消按钮，隐藏透明层，radio复原
      $('.cancelBtn').on('click',function(){
    	  $('.onfirmModal').css('display','none')
        $('input:radio[value="1"][name="IamTheLoser"]').prop("checked","false")
        $('input:radio[value="1"][name="pickUpTheLose"]').prop("checked","false")
      })
      // 透明层中的确定按钮，显示相应的确定信息，隐藏透明层，隐藏radio组，修改数据库相应的whatFlg字段
      $('.confirmBtn').on('click',function(){
        var whatFlag = $('.whatFlag').val();
        var foundFlag = $('.foundFlag').val();
        if(whatFlag == '1'||foundFlag=='2'){
	    	  $('.forSearchLoseInfo').css('display','block');    		  
        }else if(whatFlag == '0'||foundFlag=='2'){
	    	  $('.forSearchLoserInfo').css('display','block');    		      		  
        }
    	  $('.onfirmModal').css('display','none');
    	  $('.radioCheckedLi').css('display','none');
    	  var aid = $('.aid').val()
    	  $.post(
    		  "/LostAndFound/userHome?method=handleForConfirmTakenArticle",
    		  {"aid":aid},
    		  function(data){},
    		  "json"
    	  );
      })
    })
  </script> -->
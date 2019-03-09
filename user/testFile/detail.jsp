<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-touch-fullscreen" content="yes">
  <meta name="msapplication-tap-highlight" content="no">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>细节</title>
  <link rel="shortcut icon" href="/favicon.ico">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap-4.2.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/user/SUI_Mobile/sm.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/user/SUI_Mobile/sm-extend.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/user/css/common.css">
  <style type="text/css">
    .mainContent{
      height: 100%;
      padding: 3px;
      border: 0px solid #0f0;
      /*设置滚动条*/
      overflow-x: hidden;
      overflow-y: scroll;
      /*解决ios上滑动不流畅*/
      -webkit-overflow-scrolling: touch;
      /*纵向超出部分将会隐藏，即滚动条部分被挤出可视区域*/
    }
      /*设置滚动条，谷歌内核webkit*/
    .container ::-webkit-scrollbar {
        display: none;
    }
    /*设置滚动条，IE或者Firefox*/
    .container {
        -ms-overflow-style: none; /*IE 10+*/
        overflow: -moz-scrollbars-none; /*Firefox*/
    }
    .label{
      width: 140px;
    }    
    .list-block{
      padding: 5px 0px;
    }
    ul{
      padding: 2px 0px;
    }
    ul li{
      padding-top: 10px;
    }
    ul::before,ul::after{
      border: 1px solid #fff;
    }
    .issueBtn:hover{
      background-color: #fff;
    }
  </style>
</head>
<body>
  <div class="container">
    <header class="bar bar-nav header">
      <a class="button button-link button-nav pull-left back" href="${pageContext.request.contextPath }/user/01/home.jsp">
        <span class="icon icon-left"></span>返回
      </a>
      <h1 class='title'>详情</h1>
    </header>
    <!-- 中间，记录显示 -->
    <div class="mainContent" id="scrollDiv">
      <form class="list-block" style="margin-top: 20px;">
        <input type="text" class="aid" value="${article.aid}" style="display:none;">
        <input type="text" class="whatFlag" value="${article.whatFlag}" style="display:none;">
        <input type="text" class="foundFlag" value="${article.foundFlag}" style="display:none;">
        <input type="text" class="user_uid" value="${user.uid}" style="display:none;">
        <input type="text" class="article_uid" value="${article.uid}" style="display:none;">
        <ul>
          <li>
            <div class="item-content">
              <div class="item-inner">
                <div class="label">标题</div>
                <div class="item-input">
                  <input type="text" value="${article.title }" readonly>
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="item-content">
              <div class="item-inner">
                <div class="label">发布者</div>
                <div class="item-input">
                  <input type="text" value="${article.username }" readonly>
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="item-content">
              <div class="item-inner">
                <div class="label">失物类别</div>
                <div class="item-input">
                  <input type="text" value="${article.cname }" readonly>
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="item-content">
              <div class="item-inner">
                <div class="label">发布类型</div>
                <div class="item-input">
                  <c:if test="${article.whatFlag == 0 }">
	                  <input type="text" value="寻找失主" readonly>
                  </c:if>
                  <c:if test="${article.whatFlag == 1 }">
                    <input type="text" value="寻找失物" readonly>
                  </c:if>
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="item-content">
              <div class="item-inner">
                <div class="label">失物细节</div>
                <div class="item-input">
                  <textarea readonly>${article.detailinfo }</textarea>
                </div>
              </div>
            </div>
          </li>
          <!-- 用户若上传了自己的照片，就显示自己的照片；否则不显示 -->
          <li>
            <div class="item-content">
              <div class="item-inner">
                <div class="label">照片</div>
                <div class="item-input">
                  <img src="/LostAndFound/images${article.image}" style="width: 360px;height: 210px;">
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="item-content">
              <div class="item-inner" style="border-bottom: 0.5px solid #E7E7E7;margin-bottom: 5px;">
                <div class="label">联系方式</div>
                <div class="item-input">
                  <input type="text" value="${article.phone}" readonly>
                </div>
              </div>
            </div>
          </li>
          <c:if test="${article.whatFlag == 1 && article.foundflag == 1 }">
          <li class="radioCheckedLi">
            <div class="item-content">
              <div class="item-inner" style="border-bottom: 0.5px solid #E7E7E7;margin-bottom: 5px;">
                <div class="label">捡到失物</div>
                <div class="item-input">
									<div class="custom-control custom-radio custom-control-inline">
									  <input type="radio" id="forSurePickUpTheLose" name="pickUpTheLose" class="custom-control-input" value="0">
									  <label class="custom-control-label" for="forSurePickUpTheLose" style="padding-top:4px;">是</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
									  <input type="radio" id="forDonotPickUpTheLose" name="pickUpTheLose" class="custom-control-input" value="1" checked>
									  <label class="custom-control-label" for="forDonotPickUpTheLose" style="padding-top:4px;">否</label>
									</div>
                </div>
              </div>
            </div>
          </li>          
          </c:if>
          <c:if test="${article.whatFlag == 0 && article.foundflag == 1 }">
          <li class="radioCheckedLi">
            <div class="item-content">
              <div class="item-inner" style="border-bottom: 0.5px solid #E7E7E7;margin-bottom: 5px;">
                <div class="label">我是失主</div>
                <div class="item-input">
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="forIamTheLoser" name="IamTheLoser" class="custom-control-input" value="0">
                    <label class="custom-control-label" for="forIamTheLoser" style="padding-top:4px;">是</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="forIamnotTheLoser" name="IamTheLoser" class="custom-control-input" value="1" checked="checked">
                    <label class="custom-control-label" for="forIamnotTheLoser" style="padding-top:4px;">否</label>
                  </div>
                </div>
              </div>
            </div>
          </li>
          </c:if>
        </ul>
        
        <!-- 寻找失物的提示信息 -->
        <div class="text-center forSearchLoseInfo" style="color:#00B0BD;display:none;padding:10px;">
          <span>
                                     感谢您捡到失主的宝贝，打个电话通知一下吧。
          </span>
        </div>
        <div class="allInfomationDiv" style="display:none;">
	        <!-- 寻找失主的提示信息 -->
	        <div class="text-center forSearchLoserInfo" style="color:#00B0BD;display:none;padding:10px;">
	          <span>恭喜您的失物被暖心人捡到，打个电话感谢一下吧。</span><br>
	          <span>祝您尽快领回失物！</span>
	        </div>
	        <div class="text-center forSearchLoseSuccessfully" style="color:#00B0BD;display:none;padding:10px;">
	          <span>恭喜失主顺利找回心爱之物！</span>
	        </div>
	        <div class="text-center forSearchLoserSuccessfully" style="color:#00B0BD;display:none;padding:10px;">
	          <span>感谢暖心人，校园因你而骄傲！</span>
	        </div>
        </div>      
      </form>
				<div class="onfirmModal" style="display:none;">
					<div class="modal-overlay modal-overlay-visible" style="height:100%;width: 571px;margin:auto;top:0;left:0;right:0;bottom:0;"></div>
					<div class="modal modal-in" style="display: block; margin-top: -57px;">
					  <div class="modal-inner">
					  <div class="modal-text"></div>
					  </div>
					  <div class="modal-buttons ">
					  <span class="modal-button cancelBtn">取消</span>
					  <span class="modal-button modal-button-bold confirmBtn">确定</span>
					  </div>
					</div>
				</div>
    </div><!-- end of .mainContent -->
  </div> <!-- end of .container -->

  <script type='text/javascript' src='${pageContext.request.contextPath }/user/SUI_Mobile/zepto.min.js' charset='utf-8'></script>
  <script type='text/javascript' src='${pageContext.request.contextPath }/user/SUI_Mobile/sm-extend.min.js' charset='utf-8'></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js" charset="utf-8"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-4.2.1/js/bootstrap.min.js" charset="utf-8"></script>
  <script type="text/javascript">
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
        if(whatFlag == '1'||${article.foundflag=='2'}){
	    	  $('.forSearchLoseInfo').css('display','block');    		  
        }else if(whatFlag == '0'||${article.foundflag=='2'}){
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
  </script>
</body>
</html>
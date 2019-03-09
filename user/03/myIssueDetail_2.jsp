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
  <title>领取</title>
  <link rel="shortcut icon" href="/favicon.ico">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap-4.2.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/user/SUI_Mobile/sm.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/user/SUI_Mobile/sm-extend.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/user/css/common.css">
</head>
<body>
  <div class="container">
    <header class="bar bar-nav header">
      <a class="button button-link button-nav pull-left back" href="${pageContext.request.contextPath }/myIssue?method=getMyIssueArticleList&uid=${user.uid}">
        <span class="icon icon-left"></span>返回
      </a>
      <h1 class='title'>详情</h1>
      <!-- 记录为找到，且未失效时，就显示此按钮 -->
      <c:if test="${article.foundFlag==1 && article.invalidflag == 1}">
      <a class="button button-round pull-right confirmTakenBtn">编辑</a>
      </c:if>
    </header>
    <!-- 中间，记录显示 -->
    <div class="mainContent" id="mainContent">
      <form class="list-block" style="margin-top:20px;">
        <input type="text" class="aid" value="${article.aid}" style="display:none;">
        <input type="text" class="uid" value="${user.uid}" style="display:none;">
        <ul>
          <li>
            <div class="item-content">
              <div class="item-inner">
                <div class="label">标题</div>
                <div class="item-input">
                  <input type="text" value="${article.title}">
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="item-content">
              <div class="item-inner">
                <div class="label">失物类别</div>
                <div class="item-input">
                  <!-- 修改，2019/03/05 -->
                  <c:if test="${article.foundFlag==0 || article.invalidFlag==0}">
	                  <input type="text" value="${article.cname }">
                  </c:if>
                  <c:if test="${article.foundFlag==1&&article.invalidFlag==1}">
                    <select class="categoryList"></select>
                  </c:if>
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="item-content">
              <div class="item-inner">
                <div class="label">发布类型</div>
                <div class="item-input">
                  <c:if test="${article.foundFlag==0 || article.invalidFlag==0}">
                    <c:choose>
                      <c:when test="${article.whatFlag == 0 }"><input type="text" value="寻找失主"></c:when>
                      <c:when test="${article.whatFlag == 1 }"><input type="text" value="寻找失物"></c:when>
                    </c:choose>
                  </c:if>
                  <c:if test="${article.foundFlag==1&&article.invalidFlag==1}">
                    <select class="whatFlagSelection">
                      <option value="0">寻找失主</option>
                      <option value="1">寻找失物</option>
                    </select>
                  </c:if>
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="item-content">
              <div class="item-inner">
                <div class="label">联系方式</div>
                <div class="item-input">
                  <input type="text" value="${article.phone }">
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="item-content">
              <div class="item-inner">
                <div class="label">发布时间</div>
                <div class="item-input">
                  <input type="text" value="${article.issueTime }" readonly>
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="item-content">
              <div class="item-inner">
                <div class="label">物品细节</div>
                <div class="item-input">
                  <textarea>${article.detailInfo }</textarea>
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="item-content">
              <div class="item-inner" style="border-bottom: 0.5px solid #E7E7E7;margin-bottom: 5px;">
                <div class="label">照片</div>
                <div class="item-input">
                  <img src="${pageContext.request.contextPath }/images${article.image}" style="width: 360px;height: 210px;">
                </div>
              </div>
            </div>
          </li>
          <!-- 未找到，且未失效 -->
          <c:if test="${article.foundFlag == 1 && article.invalidflag == 1}">
	          <li>
	            <div class="item-content">
	              <div class="item-inner" style="border-bottom: 0.5px solid #E7E7E7;margin-bottom: 5px;">
	                <div class="label">领取状态</div>
	                <div class="item-input">
	                  <div class="custom-control custom-radio custom-control-inline">
	                    <input type="radio" id="confirmTaken" name="forConfirmTaken" class="custom-control-input" value="0">
	                    <label class="custom-control-label" for="confirmTaken" style="padding-top:4px;">确定领取</label>
	                  </div>
	                  <div class="custom-control custom-radio custom-control-inline">
	                    <input type="radio" id="cancelTaken" name="forConfirmTaken" class="custom-control-input" value="1" checked>
	                    <label class="custom-control-label" for="cancelTaken" style="padding-top:4px;">取消领取</label>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </li>
	          <li>
	            <div class="item-content">
	              <div class="item-inner" style="border-bottom: 0.5px solid #E7E7E7;margin-bottom: 5px;">
	                <div class="label">领取情况</div>
	                <div class="item-input">
	                  <textarea class="foundInfo" placeholder="请务必写下暖心人的姓名，联系方式，感谢语等信息吧"></textarea>
	                </div>
	              </div>
	            </div>
	          </li>
          </c:if>
          <!-- 已经找到 -->
          <c:if test="${article.foundFlag == 0 && article.invalidflag == 1}">
            <li>
              <div class="item-content">
                <div class="item-inner">
                  <div class="label">领取时间</div>
                  <div class="item-input">
                    <input type="text" value="${article.foundTime }">
                  </div>
                </div>
              </div>
            </li>
            <li>
              <div class="item-content">
                <div class="item-inner" style="border-bottom: 0.5px solid #E7E7E7;margin-bottom: 5px;">
                  <div class="label">领取细节</div>
                  <div class="item-input">
                    <textarea>${article.foundInfo }</textarea>
                  </div>
                </div>
              </div>
            </li>
          </c:if>
        </ul>
      </form>
      <!-- 是否认领提示 -->
      <div class="confirmModal" style="display:none;">
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
      <div class="modal toast modal-out" style="display:block;margin-top:-24px;margin-left:-48px;"></div>
    </div><!-- end of .mainContent -->
  </div> <!-- end of .container -->

  <script type='text/javascript' src='${pageContext.request.contextPath }/user/SUI_Mobile/zepto.min.js' charset='utf-8'></script>
  <script type='text/javascript' src='${pageContext.request.contextPath }/user/SUI_Mobile/sm-extend.min.js' charset='utf-8'></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js" charset="utf-8"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-4.2.1/js/bootstrap.min.js" charset="utf-8"></script>
  <script>
    $(function(){
    	$('input:radio[name="forConfirmTaken"]').on('change', function(){
    		$('.foundInfo').val('')
	    	var editBtn = $('input:radio[name="forConfirmTaken"]:checked').val()
	    	if(editBtn == "1"){
	    		$('.confirmTakenBtn').text('编辑')
	    	}else{
	    		$('.confirmTakenBtn').text('确定')    		
	    	}
    	})
    	
    	$('.confirmTakenBtn').on('click', function(){
    		var taken = $('input:radio[name="forConfirmTaken"]:checked').val();
        var aid = $('.aid').val();
        var uid = $('.uid').val();
        if(taken==0){
        	confirmOrderFn(aid,uid);
        }
    	})
    	
    	//添加，2019/03/05    	
    	getCategoryList ()
    })
    // 确定认领
    function confirmOrderFn(aid,uid){
        var foundInfo = $('.foundInfo').val();
        if(foundInfo==""||foundInfo==null){$('.foundInfo').focus();return;}
        $('.confirmModal').css('display','block')
        $('.modal-text').text('确定认领？')
		    $('.cancelBtn').on('click', function(){
		        $('.confirmModal').css('display','none')
		    })
		    $('.confirmBtn').on('click', function(){
		    	$.post(
		    			"/LostAndFound/myIssue?method=confirmOrderArticle",
		    			{"aid":aid,"uid":uid,"foundInfo":foundInfo},
		    			function(data){
		    				/* 若成功，则重新到展示此个物品详情的servlet的函数，就是进行了经过servlet的刷新 */
		    				if(data.success){
		    					window.location.href="/LostAndFound/myIssue?method=showMyIssueArticleDetail&aid="+aid+"&foundFlag=0&invalidFlag=1"
		    				}
		    			},
		    			"json"
		    	);
	        $('.confirmModal').css('display','none')
		    })
    }
    // 添加，2019/03/05
    function getCategoryList () {
      $.post(
        "/LostAndFound/category?method=findAllCategoryToAjax",
        function(data){
            var content = null;
            for(var i=0;i<data.length;i++){
              content += "<option value='"+(data[i].cid)+"'>"+data[i].cname+"</option>"
            }
            $(".categoryList").html(content);
        },
        "json"
      );
    }
  </script>
</body>
</html>
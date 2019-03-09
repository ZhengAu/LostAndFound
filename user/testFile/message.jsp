<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
  <title>信息中心</title>
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
    .deleteMyArticleBtn{
      border:0px solid red;
      position: absolute;
      right: 0px;
      top: 0px;
      padding: 0px 8px;
      background-color: #fff;
      color:#000;
      border-radius: 8px;
    }
  </style>
</head>
<body>
  <div class="container">
    <header class="bar bar-nav header">
      <h1 class='title'>信息中心</h1>
    </header>
    <!-- 中间，记录显示 -->
    <div class="mainContent" id="mainContent" onscroll="myScrollToTopFn()">
      <div class="content-wrapping">
        <div class="buttons-tab">
          <!-- 预约领取为本人发布的，他人过来领取的 -->
          <a href="#" class="tab-link button takeInfoBtn active">预约领取</a>
          <!-- 预约取回为他人发布的，本人过去领取的 -->
          <!-- <a href="#" class="tab-link button takeBackInfoBtn">预约取回</a> -->
          <a href="#" class="tab-link button systemInfoBtn">系统信息</a>
        </div>
        <!-- 领取信息 -->
        <div class="takeInfoDiv">
          <c:forEach items="${articleList }" var="article">
	          <div class="card demo-card-header-pic">
	            <div class="card-header color-white no-border no-padding">
	              <a href="javascript:;" class="deleteMyArticleBtn" onclick="handleDeleteArticle('${article.aid}','${user.uid}')">X</a>
	              <a href="${pageContext.request.contextPath }/message?method=showArticleOrderDetail&aid=${article.aid}" style="color: #000;">
	                <img class='card-cover' src="/LostAndFound/images${article.image }" style="width:538px;height:250px;">
	              </a>
	            </div>
	            <div class="card-content">
	              <div class="card-content-inner">
	                <a href="${pageContext.request.contextPath }/message?method=showArticleOrderDetail&aid=${article.aid}" style="color: #000;">
                    <strong>
                      <c:set value="${article.title}" var="myTitle"></c:set>
                      <c:choose>
                        <c:when test="${fn:length(myTitle)>10}">
                          <c:out value="${fn:substring(myTitle, 0 ,10) }...... "/>
                        </c:when>
                        <c:otherwise>
                          <c:out value="${myTitle}"/>
                        </c:otherwise>
                      </c:choose>
                    </strong>
	                </a>
	                <span class="color-gray" style="float: right;">发布于 ${article.issueTime}</span>
	                <p>
                    <strong>
                      <c:set value="${article.detailInfo}" var="detailInfo"></c:set>
                      <c:choose>
                        <c:when test="${fn:length(detailInfo)>50}">
                          <c:out value="${fn:substring(detailInfo, 0 ,50) }...... "/>
                        </c:when>
                        <c:otherwise>
                          <c:out value="${detailInfo}"/>
                        </c:otherwise>
                      </c:choose>
                    </strong>
	                </p>
	              </div>
	            </div>
	          </div>
          </c:forEach>
        </div><!-- end of .takeInfoDiv -->
        
        <!-- 系统信息 -->
        <div class="systemInfoDiv" style="display: none;">
          <c:forEach items="${systemInfoList }" var="systemInfo">
	          <div class="card">
	            <div class="card-header">
	              <a href="${pageContext.request.contextPath }/message?method=showSystemInfoDetailByInfoId&infoid=${systemInfo.infoid}" class="cardInfo" style="color: #3D414A;">
                  <strong>
                    <c:set value="${systemInfo.title}" var="infoTitle"></c:set>
                    <c:choose>
                      <c:when test="${fn:length(infoTitle)>10}">
                        <c:out value="${fn:substring(infoTitle, 0 ,10) }...... "/>
                      </c:when>
                      <c:otherwise>
                        <c:out value="${infoTitle}"/>
                      </c:otherwise>
                    </c:choose>
                  </strong>
	              </a>
	              <div class="card-header-right color-gray" style="font-size: 17px;">发布于  ${systemInfo.datetime }</div>
	            </div>
	            <div class="card-content">
	              <div class="card-content-inner">
	                <a href="${pageContext.request.contextPath }/message?method=showSystemInfoDetailByInfoId&infoid=${systemInfo.infoid}" class="cardInfo" style="color: #3D414A;">
	                  <strong>
	                    <c:set value="${systemInfo.infoDetail}" var="infoDetail"></c:set>
	                    <c:choose>
	                      <c:when test="${fn:length(infoDetail)>25}">
	                        <c:out value="${fn:substring(infoDetail,0,25) }...... "/>
	                      </c:when>
	                      <c:otherwise>
	                        <c:out value="${infoDetail}"/>
	                      </c:otherwise>
	                    </c:choose>
	                  </strong>
	                </a>
	              </div>
	            </div>
	          </div>
          </c:forEach>
        </div><!-- end of .systemInfoDiv -->
        <div class="article-end text-center" style="padding: 10px;display: none;">已经到底啦～</div>
      </div><!-- end of .content-wrapping -->
    </div><!-- end of .mainContent -->

    <!-- 底部，导航栏 -->
    <footer class="footer">
      <nav class="bar bar-tab">
        <a class="tab-item" href="../01/home.jsp">
          <span class="icon icon-home"></span>
          <span class="tab-label">首页</span>
        </a>
        <a class="tab-item" href="../02/issue.jsp">
          <span class="icon icon-edit"></span>
          <span class="tab-label">发贴</span>
        </a>
        <a class="tab-item active goToTopA" href="${pageContext.request.contextPath }/message?method=getInfoList&uid=${user.uid}">
          <span class="icon icon-message goToTopIcon"></span>
          <span class="tab-label goToTopInfo">信息</span>
        </a>
        <a class="tab-item" href="../04/me.jsp">
          <span class="icon icon-me"></span>
          <span class="tab-label">我</span>
        </a>
      </nav>
    </footer>
  </div> <!-- end of .container -->

  <script type='text/javascript' src='${pageContext.request.contextPath }/user/SUI_Mobile/zepto.min.js' charset='utf-8'></script>
  <script type='text/javascript' src='${pageContext.request.contextPath }/user/SUI_Mobile/sm-extend.min.js' charset='utf-8'></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js" charset="utf-8"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-4.2.1/js/bootstrap.min.js" charset="utf-8"></script>
  <script type="text/javascript">
    // 获取滚动的元素
    var scrollArticle = document.getElementById("mainContent")
    // 回到顶部函数
    function myScrollToTopFn() {
      // 获取滚动后的scrollTop值
      var articleScrollTop = scrollArticle.scrollTop 
      // 滚动一定距离后，显示回到顶部标识；否则复原
      if ( articleScrollTop > 200 ) {
        $('.goToTopIcon').removeClass('icon-message')
        $('.goToTopIcon').addClass('icon-up')
        $('.goToTopInfo').text('返回顶部')
        $('.goToTopA').attr('href','#')   // 去掉相对路径
        $('.goToTopA').on('click', function () {
          // 平滑的滚回到顶部
          scrollArticle.scrollTo({top:0,behavior:'smooth'})
        })
        $('.article-end').css('display','block') // 到底通知显示
      } else {
        $('.goToTopIcon').removeClass('icon-up')
        $('.goToTopIcon').addClass('icon-message')
        $('.goToTopInfo').text('信息')
        $('.goToTopA').attr('href','../03/message.jsp')  // reload current page
        $('.article-end').css('display','none')
      }
    } // end of myScrollToTopFn()
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
                window.location.href="/LostAndFound/message?method=getInfoList&uid="+uid
              }
            },
            "json"
          );
        }
      } // end of handleDeleteArticle()
    $(function(){
      // 点击卡片（领取信息），显示内容
      $('.takeInfoBtn').on('click', function(){
        $('.takeInfoDiv').show()
        $('.takeInfoBtn').addClass('active')
        $('.systemInfoDiv').hide()
        $('.systemInfoBtn').removeClass('active')
      })
      // 点击卡片（系统信息），显示内容
      $('.systemInfoBtn').on('click', function(){
        $('.systemInfoDiv').show()
        $('.systemInfoBtn').addClass('active')
        $('.takeInfoDiv').hide()
        $('.takeInfoBtn').removeClass('active')
      })
    }) // end of $(function(){})
  </script>
</body>
</html>
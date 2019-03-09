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
  <title>首页</title>
  <link rel="shortcut icon" href="/favicon.ico">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/bootstrap-4.2.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/user/SUI_Mobile/sm.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/user/SUI_Mobile/sm-extend.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/user/css/home.css">
  <style type="text/css">
    .backgroundImage-ended{
      background-image: url('../images_user/ended.png');
      background-repeat:no-repeat;
      background-position: right;
    }
  </style>
</head>
<body>
  <div class="container">
    <!-- 头部，搜索，分类显示 -->
    <header class="header sticky-top">
      <!-- 分类 -->
      <div class="header-title">
        <div class="bar bar-nav">
          <div class="buttons-row">
            <a href="javascript:;" class="tab-link button active searchRecordBtn searchLoseBtn">寻找失物</a>
            <a href="javascript:;" class="tab-link button searchRecordBtn searchLoserBtn">寻找失主</a>
          </div>
        </div>  
      </div>
      <!-- 搜索栏 -->
      <div class="header-search">
        <div class="searchbar row">
          <div class="search-input col-60">
            <label class="icon icon-search" for="search"></label>
            <input type="search" id='search' class="searchInput" placeholder='输入关键字...'/>
          </div>
          <a class="button button-fill button-primary col-20 beginSearchBtn">搜索</a>
        </div>
      </div>
    </header>
    <!-- 中间，记录显示 -->
    <article class="article" id="article" onscroll="myScrollToTopFn()">
      <!-- 此input的用途：显示本人的已经确定的有关预约领取的记录。就是本人确定我捡到失物或者我就是失主，此类记录也要显示 -->
      <input type="text" class="myUid" value="${user.uid}" style="display:none;">
      <!-- 寻找失物 -->
      <div id="searchLose" class="searchLose"></div><!-- end of .searchLose -->
      <!-- 寻找失主 -->
      <div id="searchLoser" class="searchLoser"></div><!-- end of .searchLoser -->
    </article>
    <!-- 底部，导航栏 -->
    <footer class="footer">
      <nav class="bar bar-tab">
        <a class="tab-item active goToTopA" href="../01/home.jsp">
          <span class="icon icon-home goToTopIcon"></span>
          <span class="tab-label goToTopInfo">首页</span>
        </a>
        <a class="tab-item" href="../02/issue.jsp">
          <span class="icon icon-edit"></span>
          <span class="tab-label">发贴</span>
        </a>
        <c:if test="${not empty user }">
          <a class="tab-item" href="${pageContext.request.contextPath }/myIssue?method=getMyIssueArticleList&uid=${user.uid}">
            <span class="icon icon-message"></span>
            <span class="tab-label">贴子</span>
          </a>
        </c:if>
        <c:if test="${empty user }">
          <a class="tab-item" href="../03/myIssue.jsp">
            <span class="icon icon-message"></span>
            <span class="tab-label">贴子</span>
          </a>
        </c:if>
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
  <script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-4.2.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
    // 获取滚动的元素
    var scrollArticle = document.getElementById("article")
    // 回到顶部函数
    function myScrollToTopFn() {
      // 获取滚动后的scrollTop值
      var articleScrollTop = scrollArticle.scrollTop 
      // 滚动一定距离后，显示回到顶部标识；否则复原
      if ( articleScrollTop > 400 ) {
        $('.goToTopIcon').removeClass('icon-home')
        $('.goToTopIcon').addClass('icon-up')
        $('.goToTopInfo').text('返回顶部')
        $('.goToTopA').attr('href','#')   // 去掉相对路径
        $('.goToTopA').on('click', function () {
          // 平滑的滚回到顶部
          scrollArticle.scrollTo({top:0,behavior:'smooth'})
        })
      } else {
        $('.goToTopIcon').removeClass('icon-up')
        $('.goToTopIcon').addClass('icon-home')
        $('.goToTopInfo').text('首页')
        $('.goToTopA').attr('href','../01/home.jsp')  // reload current page
      }
    } // end of myScrollToTopFn()
    // 跳转到detail.jsp页面，展示记录细节
    function showArticleDetailByAidFn(aid){
        window.location.href="/LostAndFound/userHome?method=showArticleDetailByAid&aid="+aid;
    }
    // 得到全部寻找失物，寻找失主记录
    function getAllSearchLoseFn(){
      var whatFlagStr = $('.searchRecordBtn.active').text();
      var whatFlag = ''
      if(whatFlagStr === '寻找失物'){
        whatFlag = '1'
      }else{
        whatFlag = '0'
      }
    	var uid = $('.myUid').val()
    	$.post(
    	  "/LostAndFound/userHome?method=getAllSearchLoseRecords",
    	  {"whatFlag":whatFlag,"uid":uid},
    	  function(data){
    		  var content = '';
    		  for(var i=0;i<data.articleList.length;i++){
    		    content = content + "<section class='items'>"+
    		      "<div class='row item'>"+
    		        "<div class='item-img'>"+
    		          "<a href='javascript:;' onclick='showArticleDetailByAidFn(\""+data.articleList[i].aid+"\")'> "+
    		            "<img src='/LostAndFound/images"+data.articleList[i].image+"'>"+
    		          "</a>"+
    		        "</div>"
    		        if(data.articleList[i].foundflag=='0'){
    		          content = content + "<div class='item-info col backgroundImage-ended'>"
    		        }else{
    		          content = content + "<div class='item-info col'>"
    		        }
    		        content = content +
    		        "<div class='item-info-top'>"+
    		          "<a href='javascript:;' style='color:#000;' onclick='showArticleDetailByAidFn(\""+data.articleList[i].aid+"\")'>"+
    		            "<span class='item-info-top-title'>"+data.articleList[i].titleStr+"</span>"+
    		          "</a>"+
    		          "<label class='item-info-top-category'>"+data.articleList[i].cname+"</label>"+
    		        "</div>"+
    		        "<div class='item-info-detail'>"+
    		           "<a href='javascript:;' style='color:#000;' onclick='showArticleDetailByAidFn(\""+data.articleList[i].aid+"\")'>"+
    		             "<span>"+data.articleList[i].detailinfoStr+"</span>"+
    		           "</a>"+
    		        "</div>"+
    		        "<div class='item-info-bottom text-right'>"+
    		          "<time>"+data.articleList[i].issuetimeStr+"</time>"+
    		        "</div>"+
    		      "</div>"+
    		     "</div>"+
    		    "</section>"
    		  }
          if(data.articleList.length>=9){
              content += "<div class='article-end text-center' style='padding: 10px;'>已经到底啦～</div>"
          }
    		  $('#searchLose').html(content);
    	  },
    	  "json"
    	);
    } // end of getAllSearchLoseFn()
    function getAllSearchLoserFn(){
      var whatFlagStr = $('.searchRecordBtn.active').text();
      var whatFlag = ''
      if(whatFlagStr === '寻找失物'){
        whatFlag = '1'
      }else{
        whatFlag = '0'
      }
    	var uid = $('.myUid').val()
    	$.post(
    	  "/LostAndFound/userHome?method=getAllSearchLoseRecords",
    	  {"whatFlag":whatFlag,"uid":uid},
    	  function(data){
          var content = '';
          for(var i=0;i<data.articleList.length;i++){
            content = content + "<section class='items'>"+
              "<div class='row item'>"+
                "<div class='item-img'>"+
                  "<a href='javascript:;' onclick='showArticleDetailByAidFn(\""+data.articleList[i].aid+"\")'>"+
                    "<img src='/LostAndFound/images"+data.articleList[i].image+"'></a>"+
                "</div>"
                if(data.articleList[i].foundflag=='0'){
                  content = content + "<div class='item-info col backgroundImage-ended'>"
                }else{
                  content = content + "<div class='item-info col'>"
                }
                content = content +
                  "<div class='item-info-top'>"+
                    "<a href='javascript:;' style='color:#000;' onclick='showArticleDetailByAidFn(\""+data.articleList[i].aid+"\")'>"+
                      "<span class='item-info-top-title'>"+data.articleList[i].titleStr+"</span>"+
                    "</a>"+
                    "<label class='item-info-top-category'>"+data.articleList[i].cname+"</label>"+
                  "</div>"+
                  "<div class='item-info-detail'>"+
                    "<a href='javascript:;' style='color:#000;' onclick='showArticleDetailByAidFn(\""+data.articleList[i].aid+"\")'>"+
                      "<span>"+data.articleList[i].detailinfoStr+"</span>"+
                    "</a>"+
                  "</div>"+
                  "<div class='item-info-bottom text-right'>"+
                    "<time>"+data.articleList[i].issuetimeStr+"</time>"+
                  "</div>"+
                "</div>"+
              "</div>"+
            "</section>"
          }
          if(data.articleList.length>=9){
            content += "<div class='article-end text-center' style='padding: 10px;'>已经到底啦～</div>"
          }
          $('#searchLoser').html(content);
    	  },
    	  "json"
    	);
    }// end of getAllSearchLoserFn()
    function getAllSearchRecordsFn(){
    	getAllSearchLoseFn()
    	getAllSearchLoserFn()
    } // end of getAllSearchRecordsFn()

    // 搜索展示
    function getRecordsBySearchFn(){
    		var whatFlagStr = $('.searchRecordBtn.active').text();
    		var searchContent = $('.searchInput').val();
    		if(searchContent==null||searchContent==""){$('.searchInput').focus();return;}
    		var whatFlag = ''
    		if(whatFlagStr === '寻找失物'){
    			whatFlag = '1'
    		}else{
    			whatFlag = '0'
    		}
    		$.post(
    		  "/LostAndFound/userHome?method=getMySearchRecord",
    		  {"whatFlag":whatFlag,"searchContent":searchContent},
    		  function(data){
            var content = '';
            for(var i=0;i<data.articleList.length;i++){
              content = content + "<section class='items'>"+
                "<div class='row item'>"+
                  "<div class='item-img'>"+
                    "<a href='javascript:;' onclick='showArticleDetailByAidFn(\""+data.articleList[i].aid+"\")'>"+
                      "<img src='/LostAndFound/images"+data.articleList[i].image+"'></a>"+
                  "</div>"
                  if(data.articleList[i].foundflag=='0'){
                    content = content + "<div class='item-info col backgroundImage-ended'>"
                  }else{
                    content = content + "<div class='item-info col'>"
                  }
                  content = content +
                    "<div class='item-info-top'>"+
                      "<a href='javascript:;' style='color:#000;' onclick='showArticleDetailByAidFn(\""+data.articleList[i].aid+"\")'>"+
                        "<span class='item-info-top-title'>"+data.articleList[i].titleStr+"</span>"+
                      "</a>"+
                      "<label class='item-info-top-category'>"+data.articleList[i].cname+"</label>"+
                    "</div>"+
                    "<div class='item-info-detail'>"+
                      "<a href='javascript:;' style='color:#000;' onclick='showArticleDetailByAidFn(\""+data.articleList[i].aid+"\")'>"+
                        "<span>"+data.articleList[i].detailinfoStr+"</span>"+
                      "</a>"+
                    "</div>"+
                    "<div class='item-info-bottom text-right'>"+
                      "<time>"+data.articleList[i].issuetimeStr+"</time>"+
                    "</div>"+
                  "</div>"+
                "</div>"+
              "</section>"
            }
            if(data.articleList.length>=9){
                content += "<div class='article-end text-center' style='padding: 10px;'>已经到底啦～</div>"
            }
    			  if(whatFlag=="1"){
    				  $('#searchLose').html(content);
    			  }else{
    				  $('#searchLoser').html(content);
    			  }
    		  },
    		  "json"
    		);
    } // end of getRecordsBySearchFn()
    
    $(function(){
      // 显示寻找失主的div
      $('.searchLoserBtn').on('click', function () {
        $('.searchLoseBtn').removeClass('active')
        $(this).addClass('active')
        $('#searchLose').hide()
        $('#searchLoser').show()
        scrollArticle.scrollTop = 0
        $('.searchInput').val('')//清空输入框
        getAllSearchLoserFn()//重新加载全部记录
      })
      // 显示寻找失物主的div
      $('.searchLoseBtn').on('click', function () {
        $('.searchLoserBtn').removeClass('active')
        $(this).addClass('active')
        $('#searchLoser').hide()
        $('#searchLose').show()
        scrollArticle.scrollTop = 0
        $('.searchInput').val('')//清空输入框
        getAllSearchLoseFn()//重新加载全部记录
      })
      // 点击 搜索按钮
      $('.beginSearchBtn').on('click', function(){
    	  getRecordsBySearchFn()
      })
      // 按下 回车键
      $('.searchInput').bind('keyup',function(event){
    	  if(event.keyCode == "13"){
    		  getRecordsBySearchFn()
    	  }
      })
      // 绑定输入框事件，当输入框为空时，调用显示全部记录函数
      $('.searchInput').on('keyup',function(event){
    	  if($('.searchInput').val()==""||$('.searchInput').val()==null){
    		  getAllSearchRecordsFn()
    	  }
      })
      // 一旦加载完毕，自动加载全部函数
      getAllSearchRecordsFn()
    }) // end of $(function(){})
  </script>
</body>
</html>
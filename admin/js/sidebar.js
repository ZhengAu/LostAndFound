/*
sidebar.html
左边导航栏的展开收缩功能。
*/

$(function(){
	// mynav收缩展开
	$('.mynav-item>a').on('click',function(){
		if ($(this).next().css('display') == "none") {
			//展开未展开
			$('.mynav-item').children('ul').slideUp(300);
			$(this).next('ul').slideDown(300);
			$(this).parent('li').addClass('mynav-show').siblings('li').removeClass('mynav-show');
		}else{
			//收缩已展开
			$(this).next('ul').slideUp(300);
			$('.mynav-item.mynav-show').removeClass('mynav-show');
		}
	});
});
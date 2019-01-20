/*
publishSearchInfo.html
选择图片，进行图片展示。
删除图片，隐藏显示
*/

$(function(){
	/*
		获取图片的绝对路径，展示图片；
		点击确定发布后，再上传到服务器
	*/
	$("#forUploadPhoto").on("change",function(){
		// 获取绝对路径
		var oFReader = new FileReader();
		var file = document.getElementById("forUploadPhoto").files[0];
		oFReader.readAsDataURL(file);
		// 获取图片的名称
		var uploadFile = $("#forUploadPhoto").val();
		var fileName = getFileName(uploadFile);
		// 显示图片
		oFReader.onloadend = function(oFRevent){
			var src = oFRevent.target.result;
			$(".showPhotoImg").attr("src",src);
			$(".showPhotoName").html(fileName);
			$(".showPhotoDiv").show(500);
		}
	});

	// 获取上传的图片的名称，单纯的图片名称
  function getFileName(file){
  	//通过\分隔字符串，成字符串数组
	  var arr = file.split('\\');
	  //取最后一个，就是文件名
	  return arr[arr.length-1];
	}

	// 函数，点击图片的右上角的叉，隐藏图片
	function closeShowImg(){
		$(".showPhotoDiv").hide(500);
		$(".showPhotoName").html("选择照片");
	}
	
	// 删除图片即是隐藏图片，重选图片
	$(".closeImgBtn").on("click",function(){
		closeShowImg();
	});
	// 重置，取消，把输入框等情况，把图片显示隐藏·
	$(".cancelPublish").click(function(){
		$("#forTitle").val("");
		$("#forDetail").val("");
		$("#forCategory").val("0");
		closeShowImg();
	});

});
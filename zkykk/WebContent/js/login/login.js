$(document).ready(function(){
	$("#submit_btn").on('click',function(){
		login();
    });
	$("#loginusername").on("keypress", function(){
		var event = arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异 
		if (event.keyCode == 13) {
			login();
		} 
	}); 
	$("#loginuserpwd").on("keypress", function(){
		var event = arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异 
		if (event.keyCode == 13) {
			login();
		} 
	}); 
});

function login(){
	if($('#loginusername').val() == ''){
          	  layer.alert('请输入用户名！', {
    		    skin: 'layui-layer-lan'
    		    ,closeBtn: 0
    		    ,anim: 1 //动画类型
    		  });
		$('#loginusername').focus();
		
	}else if($('#loginuserpwd').val() == ''){
		  layer.alert('请输入密码！', {
  		    skin: 'layui-layer-lan'
  		    ,closeBtn: 0
  		    ,anim: 1 //动画类型
  		  });
		$('#loginuserpwd').focus();
	}else{
		var btn = $("#submit_btn");
		var postdata= {"name":$("input[name='loginusername']").val(),"password":$("input[name='loginuserpwd']").val()};
		var contextPath = getContextPath();
		var postUrl = contextPath+"/system/logincheck.do";
		$.ajax({
			type : "POST",
			url : postUrl,
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(postdata),
			async : false,
			success : function(data) {
				if(data.key == "sucess"){   //登录成功
					window.location.href=getContextPath()+"/city/gotohomepage.do";
				}
				else if(data.key == "accounterror"){
					  layer.alert('用户不存在！', {
			    		    skin: 'layui-layer-lan'
			    		    ,closeBtn: 0
			    		    ,anim: 1 //动画类型
			    		  });
				}else if(data.key == "passworderror"){
					  layer.alert('密码错误！', {
			    		    skin: 'layui-layer-lan'
			    		    ,closeBtn: 0
			    		    ,anim: 1 //动画类型
			    		  });
				}
			}
		});
	}
}

function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
}

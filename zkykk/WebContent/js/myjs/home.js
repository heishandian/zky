$(document).ready(
		/*function(){	
			//初始化时候查询全部
			//getCities(null,'init');
			//getCities();
		}*/
		
		/*function(){
			$("#search").click(
					function(){
					 var id = $("#id").val();
					 getCities(id);
					}
			)
		}*/
	
);







function getCities(id){
	var url = "http://localhost:18080/zkyhk/city/getcitiesbypaging.do";
	$("#form").datagrid(
			{
				"url": url,
				"method": 'GET',
				"queryParams": {
					"id": id,
				}
				
			}		
	);
}


/*function getCities(id,flag){  
	//var contextPath = getContextPath(); // 
	var url = contextPath + "http://localhost:18080/zkyhk/city/"+id+"getallcities.do?flag="+flag;
	$.ajax(
			{
				type: "GET",
				url: url,
				dataType: "json",
				contentType: "application/json;charset=uft-8",
				data: JSON.stringify(data),
				async: true,
				success: function() {
					alert(123);
				}
			}
	
	);
}
*/















function getContextPath(){
	var pathName = document.location.pathname;
	var index = pathName.substr(1).indexOf("/");
	var result = pathName.substr(0,index+1);
	return result;
}
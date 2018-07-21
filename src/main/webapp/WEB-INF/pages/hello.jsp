<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script>
		$(document).ready(function() {
			
			checkForHash();
			
			$("#btn").click(function () {
				$("#postForm").submit();
			});
			
			$("#showBtn").click(function () {
				$("#alp").show();
				var str_hash = "Y";
				document.location.hash = "#" + str_hash;
			});
			
			
			$("#ajax").click(function () {
			   $.ajax({
		            url:'/ajax',
		            success:function(data){
		                alert(data);
		            },
		            error : function(xhr, status, error) {
		                 alert(error);
		                 alert(xhr);
		           	}
		        })
			});
		});
		

		function checkForHash() {
			if (document.location.hash) {
				//hash 가 있다면 ^ 를 구분자로 하나씩 string을 추출하여 각각 페이지정보를 가져옵니다.
				var str_hash = document.location.hash;
				str_hash = str_hash.replace("#","");
				
				if (str_hash == "Y") {
					$("#alp").show();
				}
			} else {
				//nothing..
			}
		}
		
		
	</script>

</head>

<body>

<form id="postForm" action="/spring-project/hello/move" method="post">
	<h1>Gradle - Spring MVC Hello World</h1>
	
	<input id="btn" type="button" value="이동하기" >
	
	
	<input id="showBtn" type="button" value="show" > 
	
	<input id="ajax" type="button" value="ajax" >
	
	<input id="alp" type="text" value="abcdefghijk" style="display:none;">
</form>
 
</body>
</html>
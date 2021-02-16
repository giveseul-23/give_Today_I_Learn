<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지</title>
<script type="text/javascript">
		var cnt = 0;
		var limit = 2; //최대 몇장?
     	function addimage() {
        if(cnt >= limit)
        {
        	alert("이미지는 최대 " + limit + "장 제한입니다.");
            return false;
        }
        else
        {
        var img = document.createElement("img");
        	img.src = document.getElementById("fileInput").value;
        	img.height = 250; 
        	img.width = 250;
        	//css추가시
        	//var class_name = "test";
        	//img.setAttribute("class", class_name);
       		document.body.appendChild(img);
        	cnt++;
        }
      	}
		
		function enrollment() {
			var imageToDB = document.getElementById("fileInput").value;
			var title = document.getElementById("txtTitle").value;
			var cate = document.getElementById("category").value;
			var loca = document.getElementById("location").value;
			var prise = document.getElementById("txtPrise").value;
			var txt = document.getElementById("txtTxt").value;
			
			var pattern1 = /^[0-9]*$/;
			
			if(title.length == 0){
	        	alert("제목을 입력해주세요.");
	        	return false;
	        }
			if(prise.length == 0){
	        	alert("가격을 입력해주세요.");
	        	return false;
	        }
			if(!pattern1.test(prise)){
				alert("가격엔 숫자만 입력 가능합니다.");
				return false;
			}
			if(txt.length == 0){
	        	alert("내용을 입력해주세요.");
	        	return false;
	        }
			if(txt.length < 10){
	        	alert("내용은 최소 10글자 이상 입력해주세요.");
	        	return false;
	        }
			
			alert("등록 완료" + cate + loca);
			return true;
		}
</script>
</head>
<body>
	사진등록 <input type="file" id="fileInput" onchange = "addimage();"/><br/>
	제목 <input type="text" id="txtTitle"/><br/>
	<form>
		카테고리<select id="category">
			<option value = "item1" selected>가전제품</option>
			<option value = "item2">의류</option>
		</select>
	</form>
	<form>
		지역<select id="location">
			<option value = "city1" selected>서울</option>
			<option value = "city2">경기도</option>
		</select>	
	</form>
	가격 <input type="text" id="txtPrise"/><br/>
	내용 <input type="text" id="txtTxt"/><br/>
	<a href="#" onclick="enrollment()">등록</a>
</body>
</html>
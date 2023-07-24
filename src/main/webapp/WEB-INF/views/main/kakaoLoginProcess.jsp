<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>








<script type="text/javascript">

function saveKakaoUser(userInfo) {
	
	// console.log(userInfo["nickname"]+"1");
	// console.log(userInfo["id"]+"1");

	const id = userInfo["id"];
	const nickname = userInfo["nickname"];
	
	console.log(id);
	console.log(nickname);
	
	const xhr = new XMLHttpRequest();

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			const safari_main_url = "http://localhost:8181/safari/main/mainPage";
			window.location.href = safari_main_url;
			
		}
	}

	
	// post 방식 
	xhr.open("post", "./saveKakaoUser");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send(`id=\${id}&nickname=\${nickname}`);

}




function getToken() {

const code = "${code}";
const client_id = "0bfc8526a72f845c4e47508748e79a4a";
const redirect_uri = "http://localhost:8181/safari/user/kakaoLogin";

console.log(code);

	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			
			/* console.log(response);

			console.log(response.token_type);
			console.log(response.access_token);
			console.log(response.expires_in);
			console.log(response.refresh_token);
			console.log(response.refresh_token_expires_in); */
			
			const access_token = response.access_token
			
			getUserInfo(access_token);

			 
		}
	}

	// post 방식 
	xhr.open("post", "https://kauth.kakao.com/oauth/token");
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	xhr.send(`grant_type=authorization_code&client_id=\${client_id}&redirect_uri=\${redirect_uri}&code=\${code}`);

}

function getUserInfo(access_token ) {

	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			const response = JSON.parse(xhr.responseText);
			
			/* console.log(response);
			console.log(response.kakao_account.profile.nickname);
			console.log(response.id); */
			
			const nickname = response.kakao_account.profile.nickname;
			const id = response.id;
			
			
			let userInfo = {
					"nickname":nickname,
					"id":id
			}
			/* console.log(userInfo["nickname"]);
			console.log(userInfo["id"]); */
			
			// 저장 
			saveKakaoUser(userInfo);
			
			/* return userInfo; */
			 
		}
	}

	// post 방식 
	xhr.open("post", "https://kapi.kakao.com/v2/user/me");
	xhr.setRequestHeader("Authorization", `Bearer \${access_token}`);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	xhr.send();

}







window.addEventListener("DOMContentLoaded",function(){
	getToken();
	

});




</script>
</body>

</html>
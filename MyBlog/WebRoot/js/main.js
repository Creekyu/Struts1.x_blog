function isPasswd(s)  {  
	// 验证是否为6-20位数字、字符、下滑线
	var patrn=/^(\w){6,20}$/;  
	if (!patrn.exec(s)) return false
	return true
}

function authForm(){
	var userName = document.getElementById("user_name").value;
	var userPwd = document.getElementById("user_pwd").value;
	var rePwd = document.getElementById("repwd").value;
	var selfInfo = document.getElementById("selfInfo").value;
	if(userPwd==""){
		if(rePwd!=""){
			alert("请输入密码");
			return false;
		}else if(selfInfo==""&&userName==""){
			alert("您未修改任何数据！");
			return false;
		}else if(selfInfo.length>20){
			alert("个性签名不可大于20字符！");
			return false;
		}else{
			alert("您已成功修改相关信息！");
			return true;
		}
	}else if(userPwd!=""){
		if(rePwd!=userPwd){
			alert("请输入相同密码!");
			return false;
		}else if(!isPasswd(userPwd)){
			alert("请输入6-20位数字、字符、下划线的密码！");
			return false;
		}else if(selfInfo.length>20){
			alert("个性签名不可大于20字符！");
			return false;
		}else{
			alert("您已成功修改相关信息!");
			return true;
		}
	}
}


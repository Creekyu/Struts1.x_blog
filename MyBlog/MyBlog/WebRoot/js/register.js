function isPasswd(s)  {  
	// 验证是否为6-20位数字、字符、下滑线
	var patrn=/^(\w){6,20}$/;  
	if (!patrn.exec(s)) return false
	return true
}

function authForm(){
	var userName = document.getElementById("user_name").value;
	var name = document.getElementById("name").value;
	var userPwd = document.getElementById("pwd").value;
	var rePwd = document.getElementById("repwd").value;
	if(userName.length > 20){
		alert("过长的用户名!");
		return false;
	}
	if(name.length > 20){
		alert("过长的昵称！");
		return false;
	}
	if(!isPasswd(userPwd)){
		alert("请输入6-20位数字、字符、下划线");
		return false;
	}
	if(userPwd!=rePwd){
		alert("两次密码输入不同！");
		return false;
	}
	return true;
}


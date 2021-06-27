function logOut(){
	window.location.href = "user.do?command=logOut";
    //不跳转的解决方法：https://blog.csdn.net/qq_37837134/article/details/79242148
	window.event.returnValue=false;
}
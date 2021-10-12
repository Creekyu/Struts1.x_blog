# Struts1.x_blog
__Web开发课设，基于老框架struts1.x__  
__感谢部分小组成员对项目部分前后端的贡献（虽然大多数写的还是要经过修改&重写才能使用），以及对期末报告的贡献__

## 简介
* 前端基于HTML+CSS+JavaScript+JQuery(极少)+Bootstrap 
* 后端基于struts1.3 + MySql5.x
* 部分样式布局参考来自：<https://github.com/Lemonreds/javaee-blog>

## 描述
* 功能上也参考了上述blog项目，但是由于开这课前没接触过任何前端，都是从头自学，而且整个项目我从开始到交给小组成员写部分后端，再到一个个修改重写完善，到最后完工一共可能也不超过三周时间，所以很多功能都是很简单的一些操作，中途遇到问题就各种找方法解决，总体看来还是比较满意的。数据库比较简单，就两个表，一个用户(user_content)一个博客表(blog_content)，每个博客对应一个user_id用来区分不同用户下的博客，贴两张图吧。  

![图1](https://github.com/Creekyu/MarkDownImageStorage/blob/master/1.png?raw=true)
![图2](https://github.com/Creekyu/MarkDownImageStorage/blob/master/2.png?raw=true)  

* 主要页面放在WEB-INF下，为受保护页面，登录以后自动跳转到main.jsp
* 但是进入main.jsp以后，可自由跳转，而不进行受保护验证，因为只有登录后才可能进入主页，在注销以后返回登录页面，且通过js修改不可返回。（这样简化了很多问题，比如每次都要验证是否登录就要写一堆验证，另外设置不能从登录页面返回也省去了很多麻烦，不用担心用户会非法访问） 
* 注意：由于框架太老很多东西不支持，如果要在本地运行，请使用Tomcat8.0以下版本，java1.8以下版本，MySql5.x版本。
* 另外本项目使用IDE为MyEclipse Pro 2014，因为新版编译器大多数不支持struts1.x了。



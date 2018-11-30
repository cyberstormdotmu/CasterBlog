<%@ page import="blog.dao.impl.BlogMarkDownDaoImpl" %>
<%@ page import="blog.domain.BlogMarkDown" %>
<%@ page import="java.util.List" %>
<%@ page import="blog.dao.impl.LogDataImpl" %>
<%@ page import="blog.domain.LogData" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 13252
  Date: 2018/11/30
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; Charset=gb2312">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>CasterWx - 一群肥宅的博客网站</title>
    <link rel="shortcut icon" href="../images/Logo_40.png" type="image/x-icon">
    <!--Layui-->
    <link href="../plug/layui/css/layui.css" rel="stylesheet" />
    <!--font-awesome-->
    <link href="../plug/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!--全局样式表-->
    <link href="../css/global.css" rel="stylesheet" />
    <!-- 本页样式表 -->
    <link href="../css/home.css" rel="stylesheet" />
</head>
<body>
<!-- 导航 -->
<nav class="blog-nav layui-header">
    <div class="blog-container">
        <!-- QQ互联登陆 -->
        <a href="javascript:;" class="blog-user">
            <i class="fa fa-qq"></i>
        </a>
        <a href="javascript:;" class="blog-user layui-hide">
            <img src="../images/Absolutely.jpg" alt="Absolutely" title="Absolutely" />
        </a>
        <!-- CasterWx -->
        <a class="blog-logo" href="/home">CasterWx</a>
        <!-- 导航菜单 -->
        <ul class="layui-nav" lay-filter="nav">
            <li class="layui-nav-item layui-this">
                <a href="/home"><i class="fa fa-home fa-fw"></i>&nbsp;网站首页</a>
            </li>
            <li class="layui-nav-item">
                <a href="/article"><i class="fa fa-file-text fa-fw"></i>&nbsp;文章专栏</a>
            </li>
            <li class="layui-nav-item">
                <a href="/resource"><i class="fa fa-tags fa-fw"></i>&nbsp;资源分享</a>
            </li>
            <li class="layui-nav-item">
                <a href="/timeline"><i class="fa fa-hourglass-half fa-fw"></i>&nbsp;点点滴滴</a>
            </li>
            <li class="layui-nav-item">
                <a href="/about"><i class="fa fa-info fa-fw"></i>&nbsp;关于本站</a>
            </li>
        </ul>
        <!-- 手机和平板的导航开关 -->
        <a class="blog-navicon" href="javascript:;">
            <i class="fa fa-navicon"></i>
        </a>
    </div>
</nav>
<!-- 主体（一般只改变这里的内容） -->
<div class="blog-body">
    <!-- canvas -->
    <canvas id="canvas-banner" style="background: #393D49;"></canvas>
    <!--为了及时效果需要立即设置canvas宽高，否则就在home.js中设置-->
    <script type="text/javascript">
        var canvas = document.getElementById('canvas-banner');
        canvas.width = window.document.body.clientWidth - 10;//减去滚动条的宽度
        if (screen.width >= 992) {
            canvas.height = window.innerHeight * 1 / 3;
        } else {
            canvas.height = window.innerHeight * 2 / 7;
        }
    </script>
    <!-- 这个一般才是真正的主体内容 -->
    <div class="blog-container">
        <div class="blog-main">
            <!-- 网站公告提示 -->
            <div class="home-tips shadow">
                <i style="float:left;line-height:17px;" class="fa fa-volume-up"></i>
                <div class="home-tips-container">
                    <span style="color: #009688">偷偷告诉大家，本博客的后台管理也正在制作，为大家准备了游客专用账号！</span>
                    <span style="color: red">网站新增留言回复啦！使用QQ登陆即可回复，人人都可以回复！</span>
                    <span style="color: red">如果你觉得网站做得还不错，来Github点个Star吧！<a href="https://github.com/CasterWx" target="_blank" style="color:#01AAED">点我前往</a></span>
                    <span style="color: #009688">CasterWx &nbsp;—— &nbsp;一个肥宅程序员的个人博客，目前正在建设中！</span>
                </div>
            </div>
            <!--左边文章列表-->

            <div class="blog-main-left">
            <%
                BlogMarkDownDaoImpl blogMarkDownDao = new BlogMarkDownDaoImpl() ;
                List<BlogMarkDown> list = blogMarkDownDao.listAll();
                for(int i=0;i<list.size();i++){
            %>
                <div class="article shadow">
                    <div class="article-left">
                        <img src="<%=list.get(i).getImgurl()%>" alt="点击查看" />
                    </div>
                    <div class="article-right">
                        <div class="article-title">
                            <a href="<%=list.get(i).getLocalurl()%>"><%=list.get(i).getTitle()%></a>
                        </div>
                        <div class="article-abstract">
                            <%=list.get(i).getCode()%>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <%-- time --%>
                    <div class="article-footer">
                        <span><i class="fa fa-clock-o"></i>&nbsp;&nbsp;<%=list.get(i).getTime()%></span>
                        <span class="article-author"><i class="fa fa-user"></i>&nbsp;&nbsp;<%=list.get(i).getAuthor()%></span>
                        <span><i class="fa fa-tag"></i>&nbsp;&nbsp;<a href="#"><%=list.get(i).getLocal()%></a></span>
                        <span class="article-viewinfo"><i class="fa fa-eye"></i>&nbsp;<%=list.get(i).getReview()%></span>   <%--review--%>
                        <span class="article-viewinfo"><i class="fa fa-commenting"></i>&nbsp;<%=list.get(i).getMemage()%></span> <%--留言--%>
                    </div>
                </div>
            <%
                }
            %>
            </div>
            <!--右边小栏目-->
            <div class="blog-main-right">
                <div class="blogerinfo shadow">
                    <div class="blogerinfo-figure">
                        <img src="../images/Absolutely.jpg" alt="Absolutely" />
                    </div>
                    <p class="blogerinfo-nickname">AntzUhl</p>
                    <p class="blogerinfo-introduce">河大程序员.</p>
                    <p class="blogerinfo-location"><i class="fa fa-location-arrow"></i>&nbsp;四川 - 南充</p>
                    <hr />
                    <div class="blogerinfo-contact">
                        <a target="_blank" title="QQ交流" href="javascript:layer.msg('启动QQ会话窗口')"><i class="fa fa-qq fa-2x"></i></a>
                        <a target="_blank" title="给我写信" href="javascript:layer.msg('antzuhl1998@gmail.com')"><i class="fa fa-envelope fa-2x"></i></a>
                        <a target="_blank" title="新浪微博" href="javascript:layer.msg('转到你的微博主页')"><i class="fa fa-weibo fa-2x"></i></a>
                        <a target="_blank" title="Github" href="javascript:layer.msg('https://github.com/CasterWx')"><i class="fa fa-git fa-2x"></i></a>
                    </div>
                </div>
                <div></div><!--占位-->
                <div class="blog-module shadow">
                    <div class="blog-module-title">热文排行</div>
                    <ul class="fa-ul blog-module-ul">
                        <%
                            for(int i=0;i<list.size();i++){
                        %>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="<%=list.get(i).getLocalurl()%>"><%=list.get(i).getTitle()%></a></li>
                        <%
                            }
                        %>
                    </ul>
                </div>
                <div class="blog-module shadow">
                    <div class="blog-module-title">最近分享</div>
                    <ul class="fa-ul blog-module-ul">
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="http://pan.baidu.com/s/1c1BJ6Qc" target="_blank">Canvas</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="http://pan.baidu.com/s/1kVK8UhT" target="_blank">pagesize.js</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="https://pan.baidu.com/s/1mit2aiW" target="_blank">时光轴</a></li>
                        <li><i class="fa-li fa fa-hand-o-right"></i><a href="https://pan.baidu.com/s/1nuAKF81" target="_blank">图片轮播</a></li>
                    </ul>
                </div>
                <div class="blog-module shadow">
                    <div class="blog-module-title">一路走来</div>
                    <dl class="footprint">
                        <%
                            LogDataImpl logData1 = new LogDataImpl() ;
                            List<LogData> logData = logData1.listAll();
                            for(int i=0;i<logData.size();i++){
                        %>
                        <dt><%=logData.get(i).getTime()%></dt>
                        <dd><%=logData.get(i).getTitle()%></dd>
                        <%
                            }
                        %>
                    </dl>
                </div>
                <div class="blog-module shadow">
                    <div class="blog-module-title">后台记录</div>
                    <dl class="footprint">
                        <dt>2017年03月16日</dt>
                        <dd>分页新增页容量控制</dd>
                        <dt>2017年03月12日</dt>
                        <dd>新增管家提醒功能</dd>
                        <dt>2017年03月10日</dt>
                        <dd>新增Win10快捷菜单</dd>
                    </dl>
                </div>
                <div class="blog-module shadow">
                    <div class="blog-module-title">友链</div>
                    <ul class="blogroll">
                        <li><a target="_blank" href="https://github.com/CasterWx" title="CasterWx">CasterWx</a></li>
                        <li><a target="_blank" href="https://github.com/CasterWxBlog" title="CasterWxBlog">CasterWxBlog</a></li>
                        <li><a target="_blank" href="https://github.com/hhw7080" title="hhw7080">hhw7080</a></li>
                        <li><a target="_blank" href="https://github.com/hibearflag" title="hibearflag">hibearflag</a></li>
                    </ul>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<!-- 底部 -->
<footer class="blog-footer">
    <p><span>Copyright</span><span>&copy;</span><span>2018</span><a href="https://github.com/CasterWx">CasterWx</a><span> By AntzUhl</span></p>
    <p><a href="http://www.github.com/CasterWx" target="_blank">@CasterWx</a></p>
</footer>
<!--侧边导航-->
<ul class="layui-nav layui-nav-tree layui-nav-side blog-nav-left layui-hide" lay-filter="nav">
    <li class="layui-nav-item layui-this">
        <a href="/home"><i class="fa fa-home fa-fw"></i>&nbsp;网站首页</a>
    </li>
    <li class="layui-nav-item">
        <a href="/article"><i class="fa fa-file-text fa-fw"></i>&nbsp;文章专栏</a>
    </li>
    <li class="layui-nav-item">
        <a href="/resource"><i class="fa fa-tags fa-fw"></i>&nbsp;资源分享</a>
    </li>
    <li class="layui-nav-item">
        <a href="/timeline"><i class="fa fa-road fa-fw"></i>&nbsp;点点滴滴</a>
    </li>
    <li class="layui-nav-item">
        <a href="/about"><i class="fa fa-info fa-fw"></i>&nbsp;关于本站</a>
    </li>
</ul>
<!--分享窗体-->
<div class="blog-share layui-hide">
    <div class="blog-share-body">
        <div style="width: 200px;height:100%;">
            <div class="bdsharebuttonbox">
                <a class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                <a class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                <a class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                <a class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" href="../aplayer/APlayer.min.css">
<div id="aplayer" style="align:center;width:500px;position:fixed; bottom:0; z-index:999;  overflow:visible;">
</div>
<script src="../aplayer/APlayer.min.js"></script>
<script>
    const ap = new APlayer({
        container: document.getElementById('aplayer'),
        audio: [{
            name: 'カサネテク',
            artist: '中关村二',
            url: '../aplayer/music.mp3',
            cover:  'http://p2.music.126.net/AWXPd_GVXCzUocAMyatE5Q==/760862046442975.jpg?param=130y130'
        }]
    });
</script>
<!--遮罩-->
<div class="blog-mask animated layui-hide"></div>
<!-- layui.js -->
<script src="../plug/layui/layui.js"></script>
<!-- 全局脚本 -->
<script src="../js/global.js"></script>
<!-- 本页脚本 -->
<script src="../js/home.js"></script>
</body>
</html>

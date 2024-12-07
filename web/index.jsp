
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>商品列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <script type="text/javascript" src="js/cart.js"></script>
</head>
<body>
<!--header-->
<jsp:include page="/header.jsp">
    <jsp:param name="flag" value="1"></jsp:param>
</jsp:include>
<!--banner-->

<%--<div class="banner">--%>
<%--    <div class="container">--%>
<%--        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">--%>
<%--            <!-- Indicators -->--%>
<%--            <ol class="carousel-indicators" id="olnum">--%>
<%--                <c:forEach items="${scroll}" var="g" varStatus="status">--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${status.first}">--%>
<%--                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            <li data-target="#carousel-example-generic" data-slide-to="${status.index}"></li>--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
<%--                </c:forEach>--%>
<%--            </ol>--%>

<%--&lt;%&ndash;            <!-- Wrapper for slides -->&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="carousel-inner" role="listbox" id="lunbotu" style="width: 1242px; height: 432px;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:forEach items="${scroll}" var="g" varStatus="status">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <c:choose>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <c:when test="${status.first}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="item active">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <h2 class="hdng"><a href="/goods_detail?id=${g.id}">${g.name}</a><span></span></h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <p>今日精选推荐</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <a class="banner_a" href="javascript:;" onclick="buy(${g.id})">立刻购买</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="banner-text">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <a href="/goods_detail?id=${g.id}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <img src="${g.cover}" alt="${g.name}" width="350" height="350">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </c:when>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <h2 class="hdng"><a href="/goods_detail?id=${g.id}">${g.name}</a><span></span></h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <p>今日精选推荐</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <a class="banner_a" href="javascript:;" onclick="buy(${g.id})">立刻购买</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="banner-text">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <a href="/goods_detail?id=${g.id}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <img src="${g.cover}" alt="${g.name}" width="350" height="350">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </c:choose>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>

<%--            <!-- Controls -->--%>
<%--            &lt;%&ndash;<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">--%>
<%--                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>--%>
<%--                <span class="sr-only">Previous</span>--%>
<%--            </a>--%>
<%--            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">--%>
<%--                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>--%>
<%--                <span class="sr-only">Next</span>--%>
<%--            </a>&ndash;%&gt;--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<!--//banner-->

<%--<div class="subscribe2"></div>--%>

<!--gallery-->
<div class="gallery">
    <div class="container">
        <div class="alert alert-danger">热销推荐</div>
        <div class="gallery-grids">
            <c:forEach items="${hotList}" var="g">
                <div class="col-md-4 gallery-grid glry-two">
                    <a href="/goods_detail?id=${g.id}">
                        <img src="${g.cover}" class="img-responsive" alt="${g.name}" width="350" height="350"/>
                    </a>
                    <div class="gallery-info galrr-info-two">
                        <p>
                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                            <a href="/goods_detail?id=${g.id}">查看详情</a>
                        </p>
                        <a class="shop" href="javascript:;" onclick="buy(${g.id})">立刻购买</a>
                        <div class="clearfix"></div>
                    </div>
                    <div class="galy-info">
                        <p>${g.typeName} > ${g.name}</p>
                        <div class="galry">
                            <div class="prices">
                                <h5 class="item_price">¥ ${g.price}</h5>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>

<%--        <div class="clearfix"></div>--%>
<%--        <div class="alert alert-info">新品推荐</div>--%>
<%--        <div class="gallery-grids">--%>
<%--            <c:forEach items="${newList}" var="g">--%>
<%--                <div class="col-md-3 gallery-grid ">--%>
<%--                    <a href="/goods_detail?id=${g.id}">--%>
<%--                        <img src="${g.cover}" class="img-responsive" alt="${g.name}"/>--%>
<%--                    </a>--%>
<%--                    <div class="gallery-info">--%>
<%--                        <p>--%>
<%--                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>--%>
<%--                            <a href="/goods_detail?id=${g.id}">查看详情</a>--%>
<%--                        </p>--%>
<%--                        <a class="shop" href="javascript:;" onclick="buy(${g.id})">立刻购买</a>--%>
<%--                        <div class="clearfix"></div>--%>
<%--                    </div>--%>
<%--                    <div class="galy-info">--%>
<%--                        <p>${g.typeName} > ${g.name}</p>--%>
<%--                        <div class="galry">--%>
<%--                            <div class="prices">--%>
<%--                                <h5 class="item_price">¥ ${g.price}</h5>--%>
<%--                            </div>--%>
<%--                            <div class="clearfix"></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>


<%--        </div>--%>
    </div>
</div>
<!--//gallery-->

<!--subscribe-->
<%--<div class="subscribe"></div>--%>
<!--//subscribe-->


<!--footer-->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
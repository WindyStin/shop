<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>订单列表</title>
    <link rel="stylesheet" href="css/bootstrap.css"/>
</head>
<body>
<div class="container-fluid">






    <jsp:include page="header.jsp"></jsp:include>


    <table class="table table-bordered table-hover">

        <tr>
            <th width="5%">ID</th>
            <th width="10%">下单用户</th>
            <th width="10%">下单时间</th>
            <th width="5%">总价</th>
            <th width="15%">商品详情</th>

        </tr>

        <c:forEach items="${p.list }" var="order">
            <tr>
                    <%--				用户id--%>
                <td><p>${order.id }</p></td>
                            <%--	下单用户--%>
                <td><p>${order.user.username }</p></td>
                            <%--	下单时间--%>
                <td><p>${order.datetime }</p></td>
                    <%--	           总价--%>
                <td><p>${order.total }</p></td>
                    <%--	商品详情 名字，价格，数量--%>
                <td>
                    <c:forEach items="${order.itemList }" var="item">
                        <p>${item.goodsName }(${item.price }) x ${item.amount}</p>
                    </c:forEach>
                </td>

            </tr>
        </c:forEach>


    </table>

    <br>
    <jsp:include page="/page.jsp">
        <jsp:param value="/admin/order_list" name="url"/>
        <jsp:param value="&status=${status}" name="param"/>
    </jsp:include>
    <br>
</div>
</body>
</html>

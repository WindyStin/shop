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

	<br>

	<ul role="tablist" class="nav nav-tabs">
		<li <c:if test="${status==0 }">class="active"</c:if> role="presentation"><a href="/admin/order_list">全部订单</a></li>
		<li <c:if test="${status==1 }">class="active"</c:if> role="presentation"><a href="/admin/order_list?status=1">未付款</a></li>
		<li <c:if test="${status==2 }">class="active"</c:if> role="presentation"><a href="/admin/order_list?status=2">已付款</a></li>
		<li <c:if test="${status==3 }">class="active"</c:if> role="presentation"><a href="/admin/order_list?status=3">配送中</a></li>
		<li <c:if test="${status==4 }">class="active"</c:if> role="presentation"><a href="/admin/order_list?status=4">已完成</a></li>
	</ul>

	<br>

	<table class="table table-bordered table-hover">

	<tr>
		<th width="5%">ID</th>
		<th width="5%">总价</th>
		<th width="15%">商品详情</th>
		<th width="20%">收货信息</th>
		<th width="10%">订单状态</th>
		<th width="10%">支付方式</th>
		<th width="10%">下单用户</th>
		<th width="10%">下单时间</th>
		<th width="10%">操作</th>
	</tr>

		<c:forEach items="${p.list }" var="order">
			<tr>
<%--				用户id--%>
				<td><p>${order.id }</p></td>
<%--	           总价--%>
				<td><p>${order.total }</p></td>
<%--	商品详情 名字，价格，数量--%>
				<td>
					<c:forEach items="${order.itemList }" var="item">
						<p>${item.goodsName }(${item.price }) x ${item.amount}</p>
					</c:forEach>
				</td>
<%--	收货信息 名字，电话，邮件--%>
				<td>
					<p>${order.name }</p>
					<p>${order.phone }</p>
					<p>${order.address }</p>
				</td>
<%--	订单状况--%>
				<td>
					<p>
						<c:if test="${order.status==2 }"><span style="color:red;">已付款</span></c:if>
						<c:if test="${order.status==3 }"><span style="color:green;">已发货</span></c:if>
						<c:if test="${order.status==4 }"><span style="color:black;">已完成</span></c:if>

					</p>
				</td>
<%--	支付方式--%>
				<td>
					<p>

						<c:if test="${order.paytype==1 }">微信</c:if>
						<c:if test="${order.paytype==2 }">支付宝</c:if>
						<c:if test="${order.paytype==3 }">货到付款</c:if>

					</p>
				</td>
<%--	下单用户--%>
				<td><p>${order.user.username }</p></td>
<%--	下单时间--%>
				<td><p>${order.datetime }</p></td>
<%--	操作--%>
				<td>
					<c:if test="${order.status==2 }">
						<a class="btn btn-success" href="/admin/order_status?id=${order.id }&status=3">发货</a>
					</c:if>
					<c:if test="${order.status==3 }">
						<a class="btn btn-warning" href="/admin/order_status?id=${order.id }&status=4">完成</a>
					</c:if>
					<a class="btn btn-danger" href="/admin/order_delete?id=${order.id }&pageNumber=${p.pageNumber}&status=${status}">删除</a>
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
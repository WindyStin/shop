<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.OrderDao" %>
<!DOCTYPE html>
<html>
<head>
  <title>销量统计</title>
  <link rel="stylesheet" href="css/bootstrap.css"/>
  <style>
    table {
      width: 70%;
      border-collapse: collapse;
      margin: 20px auto;
    }
    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: center;
    }
    th {
      background-color: #f4f4f4;
    }
  </style>
</head>

<div class="container-fluid">
<body>
<jsp:include page="header.jsp"></jsp:include>
<h1 style="text-align: center;">销量统计表</h1>
<table>
  <thead>
  <tr>
    <th>商品名称</th>
    <th>总数量</th>
    <th>总价</th>
  </tr>
  </thead>
  <tbody>
  <%
    try {
      OrderDao orderDao = new OrderDao();
      List<Map<String, Object>> summaryList = orderDao.getOrderSummary();
      if (summaryList != null && !summaryList.isEmpty()) {
        for (Map<String, Object> row : summaryList) {
  %>
  <tr>
    <td><%= row.get("goods_name") %></td>
    <td><%= row.get("total_amount") %></td>
    <td><%= row.get("total_price") %></td>
  </tr>
  <%
    }
  } else {
  %>
  <tr>
    <td colspan="3">没有数据可显示</td>
  </tr>
  <%
      }
    } catch (Exception e) {
      out.println("<tr><td colspan='3'>数据加载失败: " + e.getMessage() + "</td></tr>");
    }
  %>
  </tbody>
</table>
</div>
</body>
</html>


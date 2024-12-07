package service;

import dao.*;
import model.*;
import utils.*;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class OrderService {
    private OrderDao oDao = new OrderDao();
    public void addOrder(Order order) {
        Connection con = null;
        try {
            con = DataSourceUtils.getConnection();
            con.setAutoCommit(false);

            oDao.insertOrder(con, order);
            int id = oDao.getLastInsertId(con);
            order.setId(id);
            for(OrderItem item : order.getItemMap().values()) {
                oDao.insertOrderItem(con, item);
            }

            con.commit();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            if(con!=null)
                try {
                    con.rollback();
                } catch (SQLException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                }
        }
    }
    public List<Order> selectAll(int userid){
        List<Order> list=null;
        try {
            list = oDao.selectAll(userid);
            for(Order o :list) {
                List<OrderItem> l = oDao.selectAllItem(o.getId());
                o.setItemList(l);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
    public Page getOrderPage(int status,int pageNumber) {
        Page p = new Page();
        p.setPageNumber(pageNumber);
        int pageSize = 10;
        int totalCount = 0;
        try {
            totalCount = oDao.getOrderCount(status);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        p.SetPageSizeAndTotalCount(pageSize, totalCount);
        List list=null;
        try {
            list = oDao.selectOrderList(status, pageNumber, pageSize);
            for(Order o :(List<Order>)list) {
                List<OrderItem> l = oDao.selectAllItem(o.getId());
                o.setItemList(l);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        p.setList(list);
        return p;
    }
    public void updateStatus(int id,int status) {
        try {
            oDao.updateStatus(id, status);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public void delete(int id) {
        Connection con = null;
        try {
            con = DataSourceUtils.getDataSource().getConnection();
            con.setAutoCommit(false);

            oDao.deleteOrderItem(con, id);
            oDao.deleteOrder(con, id);
            con.commit();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            if(con!=null)
                try {
                    con.rollback();
                } catch (SQLException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                }
        }
    }

    public static Map<String, Float> calculateTotalByGoodsName(List<OrderItem> orderItems) {
        // 使用 Map 以 goodsName 为键，存储总价
        Map<String, Float> totalPriceMap = new HashMap<>();

        for (OrderItem item : orderItems) {
            String goodsName = item.getGoodsName();
            float totalItemPrice = item.getPrice() * item.getAmount();

            // 如果商品已存在，累加总价；否则初始化
            totalPriceMap.put(goodsName, totalPriceMap.getOrDefault(goodsName, 0f) + totalItemPrice);
        }

        return totalPriceMap;
    }

    // 发送邮件
    public void sendOrderEmail(int orderId) {
        try {
            // 确保获取订单详细信息
            Map<String, Object> orderDetails = oDao.getOrderDetailsById(orderId);

            if (orderDetails == null || orderDetails.isEmpty()) {
                throw new IllegalArgumentException("未找到订单详细信息！");
            }

            String recipientEmail = (String) orderDetails.get("email");
            if (recipientEmail == null || recipientEmail.trim().isEmpty()) {
                throw new IllegalArgumentException("用户邮箱地址无效！");
            }

            String subject = "您的订单详情";
            String message = "订单 ID: " + orderDetails.get("id") + "\n" +
                    "订单总额: " + orderDetails.get("total") + "\n" +
                    "收货地址: " + orderDetails.get("address");

            // 调用邮件发送工具类
            MailUtil.sendEmail(recipientEmail, subject, message);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("发送邮件失败: " + e.getMessage());
        }
    }

}

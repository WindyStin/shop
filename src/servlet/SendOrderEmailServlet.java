package servlet;

import model.Order;
import model.User;
import service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "post_email", urlPatterns = "/post_email")
public class SendOrderEmailServlet extends HttpServlet {
    private OrderService oService = new OrderService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User u = (User) request.getSession().getAttribute("user");
        if(u==null)
        {
            response.sendRedirect("/login?message=请先登录");
            return;
        }
        List<Order> list = oService.selectAll(u.getId());
        request.setAttribute("orderList", list);
        request.getRequestDispatcher("/post_email.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String orderIdStr = request.getParameter("orderId");

        if (orderIdStr == null || orderIdStr.trim().isEmpty()) {
            response.getWriter().write("订单 ID 不能为空！");
            return;
        }

        try {
            int orderId = Integer.parseInt(orderIdStr);
            oService.sendOrderEmail(orderId);
            response.getWriter().write("邮件已成功发送！");
        } catch (NumberFormatException e) {
            response.getWriter().write("订单 ID 格式无效：" + e.getMessage());
        } catch (Exception e) {
            response.getWriter().write("邮件发送失败：" + e.getMessage());
        }
    }
}

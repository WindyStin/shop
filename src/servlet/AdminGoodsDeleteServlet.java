package servlet;

import service.GoodsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "admin_goods_delete",urlPatterns = "/admin/goods_delete")
public class AdminGoodsDeleteServlet extends HttpServlet {
    private GoodsService gService = new GoodsService();
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接收参数
        int id = Integer.parseInt(request.getParameter("id"));
        int pageNumber = 0;
        if(request.getParameter("pageNumber") != null){
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        }

        int type = 0;
        if(request.getParameter("type") != null){
            type = Integer.parseInt(request.getParameter("type"));
        }
        gService.delete(id);
        //请求转发
        request.getRequestDispatcher("/admin/goods_list?pageNumber="+pageNumber+"&type="+type).forward(request, response);


    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}

package servlet;

import service.GoodsService;
import model.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name = "GoodsSearchServlet",urlPatterns = "/goods_search")
public class GoodsSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private GoodsService gService = new GoodsService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取数据框信息
        String keyword = request.getParameter("keyword");
        //获取分页信息
        int pageNumber = 1;
        if(request.getParameter("pageNumber") != null) {
            try {
                pageNumber=Integer.parseInt(request.getParameter("pageNumber") ) ;
            }
            catch (Exception e)
            {

            }
        }
        if(pageNumber<=0)
        {
            pageNumber=1;
        }
        //模糊查询
        Page p =gService.getSearchGoodsPage(keyword,pageNumber);

        if(p.getTotalPage()==0)
        {
            p.setTotalPage(1);
            p.setPageNumber(1);
        }
        else {
            //根据查询商品分页
            if(pageNumber>=p.getTotalPage()+1)
            {
                p =gService.getSearchGoodsPage(keyword,pageNumber);
            }
        }
        //查到的数据放到范围中
        request.setAttribute("p", p);
        //请求转发到jsp
        request.setAttribute("keyword", URLEncoder.encode(keyword,"utf-8"));
        request.getRequestDispatcher("/goods_search.jsp").forward(request, response);
    }

}

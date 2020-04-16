package log.servlet;

import javafx.application.Application;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

public class QuitServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        //在session销毁的时候 把loginMap中保存的键值对清除
        HttpSession session = request.getSession();
        String user_id = "";
        if(null != request.getSession().getAttribute("id") || "".equals(request.getSession().getAttribute("id"))) {
            user_id = request.getSession().getAttribute("id").toString();
        }
        int id = 0;
        //session.setAttribute("id",id);
        if(id == 0){
            Map<String, String> loginMap = (Map<String, String>)request.getSession().getServletContext().getAttribute("loginMap");
            loginMap.remove(user_id);
            request.getSession().getServletContext().setAttribute("loginMap",loginMap);
            request.getSession().invalidate();//清楚session所有信息
            System.out.println(user_id+"用户注销！");
        }

        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

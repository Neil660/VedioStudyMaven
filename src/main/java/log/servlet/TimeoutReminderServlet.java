package log.servlet;

import com.google.gson.Gson;
import log.dbconn.MySQLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;

public class TimeoutReminderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String timeNum = request.getParameter("timer");
        System.out.println(":"+timeNum);
        HttpSession session = request.getSession();
        session.setAttribute("timeNum", timeNum);
        Gson gson = new Gson();
        String result = gson.toJson(timeNum);
        response.getWriter().println(result);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}



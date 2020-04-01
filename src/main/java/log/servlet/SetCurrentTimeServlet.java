package log.servlet;

import com.google.gson.Gson;
import log.common.VoSetData;
import log.dbconn.MySQLConnection;
import log.vo.Recode;
import log.vo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;

public class SetCurrentTimeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String timestr0 = request.getParameter("time");
        String timestr = timestr0.substring(0,timestr0.lastIndexOf("."));
        int time = Integer.parseInt(timestr);

        if(time > 3) {
            time = time - 3;
        }
        HttpSession session = request.getSession();
        Recode recode = (Recode)session.getAttribute("recode");
        int id = recode.getUserID();
        int vid = recode.getVedioID();

        //UPDATE recode SET TIME=10 WHERE userId=2 AND vedioID=4
        StringBuffer sb = new StringBuffer("update recode set time=");
        sb.append(Integer.parseInt(timestr)).append(" where userID=").append(id).append(" and vedioID=").append(vid);
        String sql = sb.toString();
        try {
            VoSetData.updateVo(sql);
            recode.setTime(Integer.parseInt(timestr));
        } catch (Exception e) {
            e.printStackTrace();
        }

        session.setAttribute("recode", recode);
        Gson gson = new Gson();
        String result = gson.toJson(String.valueOf(time));
        response.getWriter().println(result);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}


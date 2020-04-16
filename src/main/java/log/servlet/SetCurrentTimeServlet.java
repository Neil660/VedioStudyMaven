package log.servlet;

import com.google.gson.Gson;
import log.common.VoSetData;
import log.dao.SingleDao;
import log.dbconn.MySQLConnection;
import log.factory.DaoFactory;
import log.tools.time.SqlTime;
import log.vo.Recode;
import log.vo.User;
import log.vo.Vedio;

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
        int timeSubtractThree = time;
        if(time > 3) {
            timeSubtractThree = timeSubtractThree - 3;
        }

        HttpSession session = request.getSession();
        SingleDao singleDao = DaoFactory.getSingleDaoInstance();
        Recode recode = (Recode) session.getAttribute("recode");
        Vedio vedio = (Vedio) session.getAttribute("vedio");
        User user = (User) session.getAttribute("user");

        int vtime = SqlTime.changeToInt(vedio.getTime());
        int id = recode.getUserID();
        int vid = recode.getVedioID();

        //UPDATE recode SET TIME=10 WHERE userId=2 AND vedioID=4
        String sql = "update recode " +
                "set time = " + time +
                " where userID = " + id + " and vedioID = " + vid;
        String sqlFinished = "update recode " +
                "set time = " + -1 +
                " where userID = " + id + " and vedioID = " + vid;
        String sqlUserIntegral = "update user u set vedioIntegral=vedioIntegral+(" +
                "SELECT IFNULL((" +
                "SELECT distinct integral FROM vedio v,recode r where v.id = r.VedioId AND r.time >= 0 AND r.vedioID = " + vid + ")" +
                ",0)) " +
                "WHERE u.id = " + id;
        try {
            //视频已经看完
            if(Math.abs(time - vtime) <= 1) {
                //如果该视频之前没完成过，则积分加上，否则不加
                VoSetData.updateVo(sqlUserIntegral);
                VoSetData.updateVo(sqlFinished);
            //视频还没看完
            } else
                VoSetData.updateVo(sql);
            recode.setTime(Integer.parseInt(timestr));
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.setAttribute("recode", recode);
        /*//向前端返回数据
        Gson gson = new Gson();
        String result = gson.toJson(String.valueOf(time));
        response.getWriter().println(result);*/
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}


package log.servlet;

import log.dao.SingleDao;
import log.dbconn.MySQLConnection;
import log.factory.DaoFactory;
import log.vo.Recode;
import log.vo.Vedio;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;

public class SingleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int vid = Integer.parseInt(request.getParameter("vedioID"));
        SingleDao singleDao = DaoFactory.getSingleDaoInstance();
        Vedio vedio = new Vedio();
        Recode recode = new Recode();
        int number = 0;

        try {
            //查找视频
            vedio = singleDao.findVedioByVid(vid);
            int id; //用户id
            HttpSession session = request.getSession();
            try {
                id = (int) session.getAttribute("id");
            }catch (NullPointerException e){
                id = 0;
            }

            //判断用户是否观看过该视频
            int sd = singleDao.isWatched(id, vid);
            if(sd == 2){
                //添加历史记录
                singleDao.insertRecode(id, vid, vedio);
                //查找对应的观看记录
                recode = singleDao.findRecodeByUidAndVid(id, vid);
                session.setAttribute("recode",recode);
            } else if(sd == 1){
                //更新历史记录中的观看时间和视频观看进度
                singleDao.updateRecodeDateAndTime(id, vid);
                //查找对应的观看记录
                recode = singleDao.findRecodeByUidAndVid(id, vid);
                session.setAttribute("recode",recode);
            }

            //根据记录表中的观看人次更新视频表中的观看人次count
            singleDao.updateVedioCount();
            session.setAttribute("vedio", vedio);
            if(id == 0){
                response.sendRedirect("single.jsp");
            } else {
                response.sendRedirect("log/single.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

package log.servlet;

import log.common.VoSetData;
import log.dbconn.MySQLConnection;
import log.factory.MysqlFactory;
import log.tools.VedioStudyConstants;
import log.tools.utilscaptcha.CaptchaUtil;
import log.vo.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class SignServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        int id = 0;
        User user = new User();
        String userName=request.getParameter("userName");
        String userPassword=request.getParameter("userPassword");
        String userPhone=request.getParameter("userPhone");
        String userEmail=request.getParameter("userEmail");
        String birthday=request.getParameter("birthday");
        String place=request.getParameter("place");
        String verCode = request.getParameter("verCode");


        //判断验证码是否正确
        if(!CaptchaUtil.ver(verCode, request)) {
            CaptchaUtil.clear(request);  // 清除session中的验证码
            PrintWriter writer = response.getWriter();
            writer.println("验证码不正确");
            writer.flush();
            return;
        }

        //检查账号是否已经存在
        try {
            StringBuffer sb = new StringBuffer("select * from user where userPhone='");
            sb.append(userPhone).append("' or userEmail='").append(userEmail).append("'");
            String sql = sb.toString();

            ResultSet result = MysqlFactory.getQueryResultSet(sql);
            if(result.next()){
                request.getSession().setAttribute("errorSta", VedioStudyConstants.EXISTING_ACCOUNTS);
                response.sendRedirect("error.jsp");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        //插入新用户数据
        try {
            String sql1 = "insert into user values(null,?,?,?,?,?,?,?)";
            Map<String, Object> map = new HashMap<>();
            map.put("userName",userName);
            map.put("userPassword",userPassword);
            map.put("userPhone",userPhone);
            map.put("userEmail",userEmail);
            map.put("birthday",birthday);
            map.put("place",place);
            id = VoSetData.insertUser(sql1, null, map);
        }catch(SQLException e){e.printStackTrace();
        } catch (Exception e) {e.printStackTrace();}

        if(id != 0) {
            user.setId(id);
            user.setUserRole(2);
            user.setUserName(userName);
            user.setUserPassword(userPassword);
            user.setUserPhone(userPhone);
            user.setUserEmail(userEmail);
            user.setBirthday(birthday);
            user.setPlace(place);
            request.getSession().setAttribute("id", id);
            response.sendRedirect("log/index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}



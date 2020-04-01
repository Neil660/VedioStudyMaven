package log.servlet;

import log.common.VoSetData;
import log.dbconn.MySQLConnection;
import log.tools.VedioStudyConstants;
import log.tools.utilscaptcha.CaptchaUtil;
import log.vo.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * 登录
 * id：用户的唯一标识
 */
public class LogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String userEmail=request.getParameter("userEmail");
        String userPassword=request.getParameter("userPassword");
        String verCode = request.getParameter("verCode");

        //判断验证码是否正确
        if(!CaptchaUtil.ver(verCode, request)) {
            CaptchaUtil.clear(request);  // 清除session中的验证码
            PrintWriter writer = response.getWriter();
            writer.println("验证码不正确");
            writer.flush();
            return;
        }

        int flag = 0;
        int id = 0;
        int userRole = 0;

        //验证密码
        try {
            StringBuffer sqlBuffer = new StringBuffer("select id, userRole, userPassword from user where userEmail='");
            sqlBuffer.append(userEmail).append("' or userPhone='").append(userEmail).append("'");
            String  sql = sqlBuffer.toString();
            String upw = null;
            User user = new User();

            user = VoSetData.queryUser(sql, user);
            id = user.getId();
            userRole = user.getUserRole();
            upw = user.getUserPassword();
            if(userPassword.equals(upw)){
                flag = 1;
            }
        }catch(SQLException e){e.printStackTrace();}
        catch (Exception e) { e.printStackTrace(); }

        //密码正确
        if(flag == 1) {
            //登录监听器，防止用户重复登录
            HttpSession session = request.getSession();
            ServletContext application = session.getServletContext();
            @SuppressWarnings("unchecked")
            Map<String, Object> loginMap = (Map<String, Object>) application.getAttribute("loginMap");
            if (loginMap == null) {
                loginMap = new HashMap<String, Object>();
            }
            String user_id = String.valueOf(id);
            for (String key : loginMap.keySet()) {
                if (user_id.equals(key)) {
                    session.setAttribute("errorSta", VedioStudyConstants.MULTIPLE_LOGINS);
                    response.sendRedirect("error.jsp");
                    return;

                }
            }
            loginMap.put(user_id,session.getId());
            application.setAttribute("loginMap", loginMap);
            // 将用户保存在session当中
            session.setAttribute("id", id);
            // session 销毁时间 单位：秒
            session.setMaxInactiveInterval(30*60);
            response.sendRedirect("log/index.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}


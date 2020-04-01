package log.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import log.common.VoSetData;
import log.dbconn.MySQLConnection;
import log.vo.*;

/**
 * 搜索
 */
public class SearchServlet extends HttpServlet {
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        List<Vedio> vedioList=null;
        vedioList = new ArrayList<>();
        
        String vname=request.getParameter("vname");
        request.getSession().setAttribute("vname",vname);
        if(vname.equals("")) {
        	request.getSession().setAttribute("vedioList",vedioList);
        	response.sendRedirect("log/search.jsp");
        }else {
            try {
                StringBuffer sqlBuffer = new StringBuffer("select * from vedio where vedioTitle like '%");
                sqlBuffer.append(vname).append("%' or category like '%").append(vname).append("%'");
                String  sql = sqlBuffer.toString();
                vedioList = VoSetData.queryVedioList(sql, vedioList);
            }catch(SQLException e){e.printStackTrace();}
            catch (Exception e) { e.printStackTrace(); }

            int id;
            HttpSession session = request.getSession();
            try {
                id = (int) session.getAttribute("id");
            }catch (NullPointerException e){
                id = 0;
            }
                request.getSession().setAttribute("vedioList", vedioList);
            if(id == 0){
                response.sendRedirect("search.jsp");
            } else {
                response.sendRedirect("log/search.jsp");
            }
        }
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}

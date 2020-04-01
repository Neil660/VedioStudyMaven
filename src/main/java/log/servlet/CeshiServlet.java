package log.servlet;

import log.common.VoSetData;
import log.dbconn.MySQLConnection;
import log.vo.Recode;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class CeshiServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //System.out.println();
        MySQLConnection dbconn;
        PreparedStatement pstmt;
        String sql = "select * from recode where userID=2";
        List<Recode> recodes = new ArrayList<>();

        try {
            recodes = VoSetData.queryRecodeList(sql, recodes);
        } catch (Exception e) {
            e.printStackTrace();
        }

        for (Recode recode:recodes) {
            System.out.println(recode.toString());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}



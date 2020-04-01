<%--
  Created by IntelliJ IDEA.
  User: 黄成毅
  Date: 2020/2/26
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="log.tools.VedioStudyConstants" %>
<html>
<head>
    <title>发生错误</title>
</head>
<body>
    <%
        String errorSta = null;
        try {
            errorSta = (String)session.getAttribute("errorSta");
        } catch (Exception e) {
            errorSta = "发生未知异常";
        }
    %>
    <h4>发生错误：<%=errorSta%></h4>
    <%
        //若账号发生未正确注销
        if(errorSta.equals(VedioStudyConstants.MULTIPLE_LOGINS)){
            try {
                String user_id = request.getSession().getAttribute("id").toString();
                int id = 0;
                session.setAttribute("id",id);
                if(id == 0){
                    Map<String, String> loginMap = (Map<String, String>)request.getSession().getServletContext().getAttribute("loginMap");
                    loginMap.remove(user_id);
                    loginMap.remove(1);
                    request.getSession().getServletContext().setAttribute("loginMap",loginMap);
                    System.out.println(user_id+"用户注销！");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
    %>
    <a href="index.jsp">用户未正常注销，点击重新登录</a>
    <%
        } else{
    %>
    <a href="index.jsp">点击此处返回主页面</a>
    <%
        }
    %>
</body>
</html>

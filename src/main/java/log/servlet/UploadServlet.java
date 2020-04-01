package log.servlet;

import log.dao.IndexDao;
import log.dbconn.MySQLConnection;
import log.factory.DaoFactory;
import log.tools.VedioUpload.ConverVideoUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.List;

public class UploadServlet extends HttpServlet {
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "vedio";
    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        //检查我们是否有文件上传请求
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if(!isMultipart){
            PrintWriter writer = response.getWriter();
            writer.println("Error: 表单必须包含 enctype=multipart/form-data");
            writer.flush();
            return;
        }

        //设置多媒体文件参数
        HashMap<String, String> map = new HashMap<String, String>();
        String filename = null;//文件名
        String filename_extension = null;//文件后缀名
        String filePath = null;
        try {
            // 为基于磁盘的文件项创建工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //配置存储库（以确保使用安全的临时位置）
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            factory.setRepository(repository);
            ////创建一个新的文件上传处理程序
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("utf-8");
            // 解析请求
            List<FileItem> items = upload.parseRequest(request);
            PrintWriter write = response.getWriter();
            for (FileItem fileItem : items) {
                //判断当前的FileItem对象封装的数据是"普通文本表单字段"
                if (fileItem.isFormField()) {
                    String value = fileItem.getString("UTF-8"); // 获取value属性的值，这里需要指明UTF-8格式，否则出现中文乱码问题
                    String name = fileItem.getFieldName();
                    map.put(name, value);
                } else{ //判断当前的FileItem对象封装的数据是"文件表单字段"
                    filename = fileItem.getName();
                    //取出后缀名
                    filename_extension = filename.substring(filename.lastIndexOf(".") + 1);
                    if (fileItem != null && !fileItem.equals("")) {
                        //截取出文件名
                        filename = filename.substring(filename.lastIndexOf("\\") + 1);
                        //给定文件名一个唯一的name
                        try {
                            IndexDao indexDAO = DaoFactory.getIndexDaoInstance();
                            filename = indexDAO.getVedioName(map.get("category"));
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    //临时文件存储目录
                    //此时的filePath必须准确到文件名，不能是一个目录，否则会抛出不能访问的异常
                    filePath = "D:/Program Files/IntelliJ IDEA 2018.3.5/running_files/VedioStudyMaven/target/temp/" + filename;

                    //创建文件
                    File file = new File(filePath);
                    file.getParentFile().mkdir();
                    file.createNewFile();

                    //获得上传文件流
                    InputStream in = fileItem.getInputStream();
                    //打开服务器端的上传文件
                    FileOutputStream fileOutputStream = new FileOutputStream(file);

                    //流的对拷
                    byte buffer[] = new byte[1024];
                    int len;
                    while ((len = in.read(buffer)) > 0) {
                        fileOutputStream.write(buffer, 0, len);
                    }
                    in.close();
                    fileOutputStream.close();
                    fileItem.delete();
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }catch (Exception e1){
            e1.printStackTrace();
        }

        System.out.println("上传成功!");
        System.out.println("-------------------------------");
        if (filename_extension.equals("avi") || filename_extension.equals("rm")
                || filename_extension.equals("rmvb") || filename_extension.equals("wmv")
                || filename_extension.equals("3gp")  || filename_extension.equals("mov")
                ||filename_extension.equals("flv")   || filename_extension.equals("ogg")) {

            ConverVideoUtils zout = new ConverVideoUtils(filePath);
            String targetExtension = ".mp4";//设置转换的格式
            boolean isDelSourseFile = true;

            //删除源文件
            boolean beginConver = zout.beginConver(targetExtension,isDelSourseFile);
            System.out.println(beginConver);
            System.out.println("=================转码过程彻底结束=====================");
        }
        response.sendRedirect("log/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

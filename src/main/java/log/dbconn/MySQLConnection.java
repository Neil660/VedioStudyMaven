package log.dbconn;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * 数据库连接类
 */
public class MySQLConnection {
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String dbURL = "jdbc:mysql://localhost:3306/vediostudy?serverTimezone=Asia/Shanghai";//设置时区
    private String user = "root";
    private String password = "root";
    private static Connection conn = null;
    private static MySQLConnection connection = null;
 
    public MySQLConnection() throws Exception {
    	try{  
            Class.forName(driver) ;  
            this.conn = DriverManager.getConnection(dbURL,user,password) ;  
            //System.out.println("数据库连接成功");
        }  
        catch (Exception e){  
        	e.printStackTrace();
            //System.out.println("数据库连接失败");
        }
    }
 
    public Connection getConnection() {
    	return this.conn;
    }
    
    public void close(){  
    	if(this.conn != null){
			try{
				this.conn.close();
			}catch(Exception e){e.printStackTrace();}
		}       
    } 
    
}

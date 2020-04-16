package log.factory;

import log.dbconn.MySQLConnection;

import java.sql.*;

/**
 * 数据库连接类工厂
 */
public class MysqlFactory {

    public static ResultSet getQueryResultSet(String sql) throws Exception {
        return getPreSta(sql).executeQuery();
    }

    public static ResultSet getGeneratedKeysResultSet(PreparedStatement pstmt) throws Exception {
        return pstmt.getGeneratedKeys();
    }

    public static PreparedStatement getUpdateResultSet(String sql) throws Exception {
        return getPreSta(sql);
    }

    //获得连接
    public static Connection getConn() throws Exception {
        return new MySQLConnection().getConnection();
    }

    //获取预处理语句
    public static PreparedStatement getPreSta(String sql) throws Exception {
        return getConn().prepareStatement(sql);
    }

    public static PreparedStatement getPreStaGeneratedKeys(String sql) throws Exception {
        return getConn().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
    }

    //执行更新
    public static int executeMyUpdate(PreparedStatement pstat)  throws Exception {
        return pstat.executeUpdate();
    }
}

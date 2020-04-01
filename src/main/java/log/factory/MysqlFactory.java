package log.factory;

import log.dbconn.MySQLConnection;

import java.sql.*;
import java.util.List;

/**
 * 数据库连接类工厂
 */
public class MysqlFactory {

    public static ResultSet getQueryResultSet(String sql) throws Exception{
        return getPreSta(sql).executeQuery();
    }

    public static ResultSet getGeneratedKeysResultSet(PreparedStatement pstmt) throws Exception{
        return pstmt.getGeneratedKeys();
    }

    public static int getUpdateResultSet(String sql) throws Exception{
        return getPreSta(sql).executeUpdate();
    }

    public static Connection getConn() throws Exception{
        return new MySQLConnection().getConnection();
    }

    public static PreparedStatement getPreSta(String sql) throws Exception{
        return getConn().prepareStatement(sql);
    }

    public static PreparedStatement getPreStaGeneratedKeys(String sql) throws Exception{
        return getConn().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
    }
}

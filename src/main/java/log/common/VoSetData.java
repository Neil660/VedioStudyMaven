package log.common;

import log.dbconn.MySQLConnection;
import log.factory.MysqlFactory;
import log.vo.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import static log.factory.MysqlFactory.getGeneratedKeysResultSet;

/**
 * CRUD
 * 结果返回集合
 */
public class VoSetData {

    public static List<Recode> queryRecodeList(String sql, List<Recode> list) throws Exception{
        final ResultSet result = MysqlFactory.getQueryResultSet(sql);
        while(result.next()) {
            Recode recode=new Recode();
            recode.setId(result.getInt("id"));
            recode.setUserID(result.getInt("userID"));
            recode.setVedioID(result.getInt("vedioID"));
            recode.setTitle(result.getString("title"));
            recode.setUrl(result.getString("url"));
            recode.setPublisher(result.getString("publisher"));
            recode.setCount(result.getInt("count"));
            recode.setTime(result.getInt("time"));
            recode.setDate(result.getTimestamp("date"));
            list.add(recode);
        }
        return list;
    }

    public static Recode queryRecode(String sql, Recode recode) throws Exception{
        final ResultSet result = MysqlFactory.getQueryResultSet(sql);
        while(result.next()) {
            recode.setId(result.getInt("id"));
            recode.setUserID(result.getInt("userID"));
            recode.setVedioID(result.getInt("vedioID"));
            recode.setTitle(result.getString("title"));
            recode.setUrl(result.getString("url"));
            recode.setPublisher(result.getString("publisher"));
            recode.setCount(result.getInt("count"));
            recode.setTime(result.getInt("time"));
            recode.setDate(result.getTimestamp("date"));
        }
        return recode;
    }

    public static List<Vedio> queryVedioList(String sql, List<Vedio> list) throws Exception{
        final ResultSet result = MysqlFactory.getQueryResultSet(sql);
        while(result.next()) {
            Vedio vedio=new Vedio();
            vedio.setId(result.getInt("id"));
            vedio.setVedioTitle(result.getString("vedioTitle"));
            vedio.setUrl(result.getString("url"));
            vedio.setPublisher(result.getString("publisher"));
            vedio.setRelease(result.getTimestamp("release"));
            vedio.setCount(result.getInt("count"));
            vedio.setTime(result.getTime("time"));
            vedio.setCategory(result.getString("category"));
            vedio.setIntroduce(result.getString("introduce"));
            list.add(vedio);
        }
        return list;
    }

    public static Vedio queryVedio(String sql, Vedio vedio) throws Exception{
        final ResultSet result = MysqlFactory.getQueryResultSet(sql);
        while(result.next()) {
            vedio.setId(result.getInt("id"));
            vedio.setVedioTitle(result.getString("vedioTitle"));
            vedio.setUrl(result.getString("url"));
            vedio.setPublisher(result.getString("publisher"));
            vedio.setRelease(result.getTimestamp("release"));
            vedio.setCount(result.getInt("count"));
            vedio.setTime(result.getTime("time"));
            vedio.setCategory(result.getString("category"));
            vedio.setIntroduce(result.getString("introduce"));
        }
        return vedio;
    }

    public static void insertVedio(String sql, Vedio vedio, Map<String,Object> map) throws Exception{
        MySQLConnection dbconn = new MySQLConnection();
        PreparedStatement pstmt = dbconn.getConnection().prepareStatement(sql);
        pstmt.setInt(1, (Integer) map.get("uid"));
        pstmt.setInt(2, (Integer) map.get("vid"));
        pstmt.setString(3, vedio.getVedioTitle());
        pstmt.setString(4, vedio.getUrl());
        pstmt.setString(5, vedio.getPublisher());
        pstmt.setInt(6, vedio.getCount());
        pstmt.setTimestamp(7, (Timestamp) map.get("releaseTime"));
        pstmt.setInt(8, 0);
        pstmt.executeUpdate();
    }

    public static User queryUser(String sql, User user) throws Exception{
        final ResultSet result = MysqlFactory.getQueryResultSet(sql);
        while(result.next()) {
            user.setId(result.getInt("id"));
            user.setUserRole(result.getInt("userRole"));
            user.setUserName(result.getString("userName"));
            user.setUserPassword(result.getString("userPassword"));
            user.setUserPhone(result.getString("userPhone"));
            user.setUserEmail(result.getString("userEmail"));
            user.setBirthday(result.getString("birthday"));
            user.setPlace(result.getString("place"));
        }
        return user;
    }

    public static int insertUser(String sql, User user, Map<String,Object> map) throws Exception{
        MySQLConnection dbconn = new MySQLConnection();
        PreparedStatement pstmt = MysqlFactory.getPreStaGeneratedKeys(sql);
        pstmt.setInt(1, 2);//用户角色
        pstmt.setString(2, (String) map.get("userName"));
        pstmt.setString(3, (String) map.get("userPassword"));
        pstmt.setString(4, (String) map.get("userPhone"));
        pstmt.setString(5, (String) map.get("userEmail"));
        pstmt.setString(6, (String) map.get("birthday"));
        pstmt.setString(7, (String) map.get("place"));
        int res =  pstmt.executeUpdate();
        ResultSet resultSet = getGeneratedKeysResultSet(pstmt);
        if(resultSet.next()){
            return resultSet.getInt(1);//返回主键
        }
        return res;
    }

    public static int updateVo(String sql) throws Exception{
        return MysqlFactory.getUpdateResultSet(sql);
    }
}

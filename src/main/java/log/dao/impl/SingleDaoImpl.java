package log.dao.impl;

import log.common.VoSetData;
import log.dao.SingleDao;
import log.factory.MysqlFactory;
import log.vo.Recode;
import log.vo.Vedio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

public class SingleDaoImpl implements SingleDao {
    public int isWatched(int uid, int vid) throws Exception{
        int ret = 0;
        if(uid == 0){
            return ret;
        }
        StringBuffer sqlBuffer = new StringBuffer("select * from recode where userID=");
        sqlBuffer.append(uid).append(" and vedioID=").append(vid);
        String sql = sqlBuffer.toString();
        try {
            ResultSet result = MysqlFactory.getQueryResultSet(sql);
            if(!result.next()){
                ret = 2;    //表示未看过该视频
            } else {
                ret = 1;    //表示看过该视频
            }
        }catch(SQLException e){
            e.printStackTrace();
        }

        return ret;
    }

    public Recode findRecodeByUidAndVid(int uid, int vid) throws Exception{
        int ret = 0;
        if(uid == 0){
            return null;
        }
        Recode recode = new Recode();
        StringBuffer sqlBuffer = new StringBuffer("select * from recode where userID=");
        sqlBuffer.append(uid).append(" and vedioID=").append(vid);
        String sql = sqlBuffer.toString();
        try {
            recode = VoSetData.queryRecode(sql,recode);
        }catch(SQLException e){
            e.printStackTrace();
        }

        return recode;
    }

    public Vedio findVedioByVid(int vid) throws Exception {
        Vedio vedio = new Vedio();
        StringBuffer sqlBuffer = new StringBuffer("select * from vedio where id=");
        sqlBuffer.append(vid);
        String sql = sqlBuffer.toString();
        try {
            vedio = VoSetData.queryVedio(sql,vedio);
            vedio.setId(vid);
            vedio.setCount(vedio.getCount() + 1);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return vedio;
    }

    public void insertVedio (int uid, int vid, Vedio vedio) throws Exception{
        Timestamp releaseTime = new Timestamp(System.currentTimeMillis());
        String sql = "insert into recode values(null,?,?,?,?,?,?,?,?)";
        try {
            Map<String,Object> map = new HashMap<>();
            map.put("uid", uid);
            map.put("vid", vid);
            map.put("releaseTime", releaseTime);
            VoSetData.insertVedio(sql,vedio,map);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateRecodeDateAndTime (int uid, int vid) throws Exception{
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp tsf = new Timestamp(System.currentTimeMillis());
        String tss = formatter.format(tsf);
        Timestamp ts = Timestamp.valueOf(tss);
        StringBuffer sb = new StringBuffer("update recode set count=count+1,date='");
        sb.append(ts).append("' where userID=").append(uid).append(" and vedioID=").append(vid);
        String sql = sb.toString();
        try {
            VoSetData.updateVo(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
    }

    public void updateVedioCount () throws Exception{
        StringBuffer sb = new StringBuffer("update recode,vedio set recode.count=recode.count+1,vedio.count=vedio.count+1 where recode.vedioID=vedio.id");
        String sql = sb.toString();
        try {
            VoSetData.updateVo(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
    }
}

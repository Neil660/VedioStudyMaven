package log.dao.impl;

import log.common.VoSetData;
import log.dao.HistoryDao;
import log.vo.Recode;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class HistoryDaoImpl implements HistoryDao {

    public List<Recode> findHisoryByUid (int id) throws Exception {
        List<Recode> recenList = null;
        recenList = new ArrayList<Recode>();
        String sql = "select * from recode where userID = " + id + " and time >= 0";

        //查找该用户的视频记录
        try {
            recenList = VoSetData.queryRecodeList(sql, recenList);
        }catch(SQLException e){ e.printStackTrace(); }

        //将视频记录按照观看时间倒序排序
        int len = recenList.size();
        int[] ids = new int[len];
        String[] ts = new String[len];
        int j = 0;
        //HH:mm:ss是24小时制，hh:mm:ss是12小时制
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for(Recode recode:recenList){
            ts[j++] = formatter.format(recode.getDate());
        }
        Arrays.sort(ts);

        String[] sqlArr = new String[len];
        StringBuffer[] sqlBufferArr = new StringBuffer[len];
        for(int i = 0;i < len ;i++){
            sqlBufferArr[i] = new StringBuffer();
        }
        List<Recode> rel = new ArrayList<>();
        for (int i = 0;i < len; i++) {
            sqlBufferArr[i].append("select * from recode where date=''");
            sqlBufferArr[i].insert(33,ts[recenList.size() - i - 1]);
            sqlArr[i] = sqlBufferArr[i].toString();
            try {
                rel = VoSetData.queryRecodeList(sqlArr[i], rel);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return rel;
    }

    public List<Recode> findHisoryFinishedByUid (int id) throws Exception {
        List<Recode> recenList = null;
        recenList = new ArrayList<Recode>();
        String sql = "select * from recode where userID = " + id + " and time = -1";

        //查找该用户的视频记录
        try {
            recenList = VoSetData.queryRecodeList(sql, recenList);
        }catch(SQLException e){ e.printStackTrace(); }

        //将视频记录按照观看时间倒序排序
        int len = recenList.size();
        int[] ids = new int[len];
        String[] ts = new String[len];
        int j = 0;
        //HH:mm:ss是24小时制，hh:mm:ss是12小时制
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for(Recode recode:recenList){
            ts[j++] = formatter.format(recode.getDate());
        }
        Arrays.sort(ts);

        String[] sqlArr = new String[len];
        StringBuffer[] sqlBufferArr = new StringBuffer[len];
        for(int i = 0;i < len ;i++){
            sqlBufferArr[i] = new StringBuffer();
        }
        List<Recode> rel = new ArrayList<>();
        for (int i = 0;i < len; i++) {
            sqlBufferArr[i].append("select * from recode where date=''");
            sqlBufferArr[i].insert(33,ts[recenList.size() - i - 1]);
            sqlArr[i] = sqlBufferArr[i].toString();
            try {
                rel = VoSetData.queryRecodeList(sqlArr[i], rel);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return rel;
    }

}

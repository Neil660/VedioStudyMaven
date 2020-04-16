package log.dao.impl;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

import log.common.VoSetData;
import log.dao.IndexDao;
import log.factory.DaoFactory;
import log.factory.MysqlFactory;
import log.vo.*;

public class IndexDaoImpl implements IndexDao {
	public List<Recode> findRecentlyVedioByUid (int id) throws Exception {
		List<Recode> recenList = null;
        recenList = new ArrayList<Recode>();
		String sql = "select * from recode where userID = " + id + " and time != -1";
        try {
            recenList = VoSetData.queryRecodeList(sql, recenList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return recenList;
	}
	
	public int[] findLastestRecode (List<Recode> recodeList) throws Exception {
		int len = recodeList.size();
		int[] id = new int[len];
        if(recodeList.size() == 0){
            return id;
        }
        String[] ts = new String[len];
        int j = 0;
        //HH:mm:ss是24小时制，hh:mm:ss是12小时制
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(Recode recode:recodeList){
			ts[j++] = formatter.format(recode.getDate());
		}
        Arrays.sort(ts);

        String[] sqlArr = new String[len > 3 ? 3 : len];//最多显示三条历史记录
        StringBuffer[] sqlBufferArr = new StringBuffer[len > 3 ? 3 : len];
        for(int i = 0;i < sqlBufferArr.length ;i++){
            sqlBufferArr[i] = new StringBuffer();
        }
        int[] imaxgroud = new int[len > 3 ? 3 : len];//存放最新历史视频记录的id
        for (int i = 0; i < 3 && i < len; i++) {
            sqlBufferArr[i].append("select id from recode where date=''");
            sqlBufferArr[i].insert(34,ts[recodeList.size() - i - 1]);
            sqlArr[i] = sqlBufferArr[i].toString();
            try {
                ResultSet result = MysqlFactory.getQueryResultSet(sqlArr[i]);
                while (result.next()) {
                    imaxgroud[i] = result.getInt("id");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

		return imaxgroud;
	}

    public List<Recode> findRecodeByRids (int[] ids) throws Exception {
        List<Recode> recenList = null;
        recenList = new ArrayList<Recode>();
        int len = ids.length;

        String[] sqlArr = new String[len];
        StringBuffer[] sbArr = new StringBuffer[len];
        for(int i = 0;i < sbArr.length ;i++){
            sbArr[i] = new StringBuffer();
        }
        for(int i = 0;i < 3 && i < len;i++) {
            sbArr[i].append("select * from recode where id=").append(ids[i]);
            sqlArr[i] = sbArr[i].toString();
            try {
                recenList = VoSetData.queryRecodeList(sqlArr[i], recenList);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return recenList;
    }

    public List<Vedio> findVedioByCate (String category) throws Exception {
        List<Vedio> vedioList = null;
        vedioList = new ArrayList<Vedio>();
        StringBuffer sb = new StringBuffer("select * from vedio where category=''");
        sb.insert(36,category);
        String sql = sb.toString();
        try {
            vedioList = VoSetData.queryVedioList(sql, vedioList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vedioList;
    }

    public String getVedioName (String category) throws Exception {
        String vname = null;
        int vnameNum = 0;
        StringBuffer sb = new StringBuffer("select count(id)+1 from vedio where category='");
        sb.append(category).append("'");
        String sql = sb.toString();
        try {
            ResultSet result = MysqlFactory.getQueryResultSet(sql);
            while(result.next()) {
                vnameNum = result.getInt(1);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }

        StringBuffer sbVName = new StringBuffer(category);
        sbVName.append("_").append(vnameNum).append(".avi");
        vname = sbVName.toString();
        return vname;
    }

    public void insertVedio (Map<String,Object> map) throws Exception {
        IndexDao indexDAO = DaoFactory.getIndexDaoInstance();
	    String vedioName = indexDAO.getVedioName((String) map.get("category"));
	    String url = "vedio/" + (String) map.get("category") + "_" + vedioName.substring(vedioName.indexOf("_") + 1, vedioName.indexOf("."));

        Timestamp release = new Timestamp(System.currentTimeMillis());
        String sql  = "insert into vedio value(null,?,?,?,?,?,?,?,?,?)";
        map.put("url", url);
        map.put("release", release);
        map.put("count", 0);

        try {
            VoSetData.insertVedio(sql, map);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

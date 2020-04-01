package log.dao.impl;

import log.common.VoSetData;
import log.dao.ShowDao;
import log.vo.Vedio;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShowDaoImpl implements ShowDao {
    public List<Vedio> findCateShow (String category) throws Exception {
        List<Vedio> vedioList = null;
        vedioList = new ArrayList<Vedio>();
        StringBuffer sqlBuffer = new StringBuffer("select * from vedio where category='");
        sqlBuffer.append(category).append("'");
        String sql = sqlBuffer.toString();

        try {
            vedioList = VoSetData.queryVedioList(sql, vedioList);
        }catch(SQLException e){
            e.printStackTrace();
        }

        return vedioList;
    }

}

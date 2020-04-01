package log.dao;

import java.util.List;
import log.vo.*;

public interface IndexDao {

	//最近观看的视频
	public List<Recode> findRecentlyVedioByUid (int id) throws Exception;
	
	//查询历史中最新的三条视频
	public int[] findLastestRecode (List<Recode> recodeList) throws Exception;

	//根据id查找视频记录
    public List<Recode> findRecodeByRids (int[] ids) throws Exception;

    //通过类别寻找视频
    public List<Vedio> findVedioByCate (String category) throws Exception;

    //根据视频类别给视频命名
    public String getVedioName (String category) throws Exception;
}

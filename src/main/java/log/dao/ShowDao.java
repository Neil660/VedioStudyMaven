package log.dao;

import java.util.List;
import log.vo.*;

public interface ShowDao {

    //查找同类别的视频
	public List<Vedio> findCateShow (String category) throws Exception ;
	
}

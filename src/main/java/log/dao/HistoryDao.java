package log.dao;

import log.vo.Recode;

import java.util.List;

public interface HistoryDao {

    //根据用户id查找所有的历史记录并倒序排序
    public List<Recode> findHisoryByUid (int id) throws Exception;

    //根据用户id查找所有已看完的的视频并倒序排序
    public List<Recode> findHisoryFinishedByUid (int id) throws Exception;

}

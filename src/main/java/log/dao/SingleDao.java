package log.dao;

import log.vo.Recode;
import log.vo.Vedio;

public interface SingleDao {

    //判断用户是否观看过该视频，返回值为0说明未登陆，为1说明已经有记录，为2说明未观看过该视频
    public int isWatched(int uid, int vid) throws Exception;

    //通过用户id跟视频id查找单一记录
    public Recode findRecodeByUidAndVid(int uid, int vid) throws Exception;

    //通过id查找视频信息
    public Vedio findVedioByVid(int vid) throws Exception;

    //插入视频信息
    public void insertRecode (int uid, int vid, Vedio vedio) throws Exception;

    //更新更新历史记录中的观看时间和视频观看进度
    public void updateRecodeDateAndTime (int uid, int vid) throws Exception;

    //根据记录表中的观看人次更新视频表中的观看人次count
    public void updateVedioCount () throws Exception;



}

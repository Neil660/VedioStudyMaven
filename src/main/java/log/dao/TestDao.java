package log.dao;

import log.vo.Test;

import java.util.List;

public interface TestDao {
    //通过vid查找试题
    public List<Test> getALlTestByVid(int vid) throws Exception;

    //判断是否答对
}

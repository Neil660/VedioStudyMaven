package log.dao.impl;

import log.common.VoSetData;
import log.dao.TestDao;
import log.vo.Test;

import java.util.ArrayList;
import java.util.List;

public class TestDaoImpl implements TestDao {
    public List<Test> getALlTestByVid(int vid) throws Exception {
        List<Test> testList = new ArrayList<>();
        String sql = "select * from test where vid = " + vid;
        try {
            testList = VoSetData.queryTestList(sql, testList);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return testList;
    }
}

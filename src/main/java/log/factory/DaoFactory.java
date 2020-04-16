package log.factory;

import log.dao.*;
import log.dao.impl.*;
import log.vo.Test;

/**
 * Dao工厂
 */
public class DaoFactory {
	
	public static IndexDao getIndexDaoInstance () {  
        return new IndexDaoImpl();
    }

    public static ShowDao getShowDaoInstance () {
        return new ShowDaoImpl();
    }

    public static HistoryDao getHistoryDaoInstance () {
	    return new HistoryDaoImpl();
	}

    public static SingleDao getSingleDaoInstance () {
	    return new SingleDaoImpl();
	}

	public static UserDao getUserDaoInstance() {
	    return new UserDaoImpl();
    }

    public static TestDao getTestDaoInstance() {
	    return new TestDaoImpl();
    }
}

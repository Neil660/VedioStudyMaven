package log.factory;

import log.dao.*;
import log.dao.impl.HistoryDaoImpl;
import log.dao.impl.IndexDaoImpl;
import log.dao.impl.ShowDaoImpl;
import log.dao.impl.SingleDaoImpl;

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
}

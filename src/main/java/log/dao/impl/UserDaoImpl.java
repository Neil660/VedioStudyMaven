package log.dao.impl;

import log.common.VoSetData;
import log.dao.UserDao;
import log.vo.User;

public class UserDaoImpl implements UserDao {
    public User getUserById(int id) throws  Exception {
        User user = new User();
        String sql = "select * from user where id = " + id;
        try {
            VoSetData.queryUser(sql, user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}

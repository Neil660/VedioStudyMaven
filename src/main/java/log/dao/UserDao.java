package log.dao;

import log.vo.User;

public interface UserDao {
    //通过id查找用户
    public User getUserById(int id) throws  Exception;
}

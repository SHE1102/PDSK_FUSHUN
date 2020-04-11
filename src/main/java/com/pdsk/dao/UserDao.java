package com.pdsk.dao;

import com.pdsk.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by Administrator on 2020/2/10 0010.
 */

@Repository
public interface UserDao {
    boolean login(User user);
    User findUserByUsernameAndPassword(@Param("username") String username, @Param("password")String password) throws SQLException;
    Integer findUserByName(@Param("username")String name);
    boolean insertUser(User user);
    boolean updateUser(User user);
    boolean deleteUser(String id);
    List<User> findUsers(@Param("start")int start,@Param("size")int size);
    Integer getUsersTotalCount();
}

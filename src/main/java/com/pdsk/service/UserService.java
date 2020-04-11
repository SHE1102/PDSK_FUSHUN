package com.pdsk.service;


import com.pdsk.domain.User;
import com.pdsk.util.Page;

import java.sql.SQLException;

/**
 * Created by Administrator on 2020/2/10 0010.
 */
public interface UserService {
    boolean login(String username, String password);
    User findUserByUsernameAndPassword(String username, String password) throws SQLException;
    Integer findUserByName(String username);
    boolean insertUser(User user);
    boolean updateUser(User user);
    boolean deleteUser(String id);
    Page getUserPageByPageNum(int pageNum);
}

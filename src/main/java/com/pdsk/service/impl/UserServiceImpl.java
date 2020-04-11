package com.pdsk.service.impl;

import com.pdsk.dao.UserDao;
import com.pdsk.domain.User;
import com.pdsk.service.UserService;
import com.pdsk.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2020/2/10 0010.
 */

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public boolean login(String username, String password) {
        User user  = new User();
        user.setName(username);
        user.setPassword(password);
        return userDao.login(user);
    }

    @Override
    public User findUserByUsernameAndPassword(String username, String password) throws SQLException {
        return userDao.findUserByUsernameAndPassword(username,password);
    }

    @Override
    public Integer findUserByName(String username) {
        return userDao.findUserByName(username);
    }

    @Override
    public boolean insertUser(User user) {
        user.setId(UUID.randomUUID().toString());
        return userDao.insertUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public boolean deleteUser(String id) {
        return userDao.deleteUser(id);
    }


    @Override
    public Page getUserPageByPageNum(int pageNum) {

        Page page = new Page();
        page.setCurrPageNum(pageNum);

        int totalCount = userDao.getUsersTotalCount();
        page.setTotalRecordSize(totalCount);

        int size = page.getPageSize();// 每页显示数；
        int start = (page.getCurrPageNum() - 1) * page.getPageSize();// 计算当前页

        List<User> User = userDao.findUsers(start, size);
        page.setUserList(User);

        return page;
    }

}

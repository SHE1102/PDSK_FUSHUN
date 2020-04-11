package com.pdsk.service.impl;

import com.pdsk.dao.EmailDao;
import com.pdsk.domain.Email;
import com.pdsk.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2020/2/12 0012.
 */
@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private EmailDao emailDao;

    @Override
    public Email findEmail() {
        return emailDao.findEmail();
    }

    @Override
    public boolean updateEmail(Email email) {
        return emailDao.updateEmail(email);
    }

    @Override
    public boolean insertEmail(Email email) {
        return emailDao.insertEmail(email);
    }
}

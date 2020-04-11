package com.pdsk.service;

import com.pdsk.domain.Email;

/**
 * Created by Administrator on 2020/2/12 0012.
 */
public interface EmailService {
    Email findEmail();
    boolean updateEmail(Email email);
    boolean insertEmail(Email email);
}

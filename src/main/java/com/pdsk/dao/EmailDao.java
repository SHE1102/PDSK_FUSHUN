package com.pdsk.dao;

import com.pdsk.domain.Email;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2020/2/12 0012.
 */
@Repository
public interface EmailDao {
    Email findEmail();
    boolean updateEmail(Email email);
    boolean insertEmail(Email email);
}

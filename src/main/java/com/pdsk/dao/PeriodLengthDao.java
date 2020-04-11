package com.pdsk.dao;

import com.pdsk.domain.TIMEs;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2020/2/12 0012.
 */
@Repository
public interface PeriodLengthDao {
    TIMEs findTime();
    boolean updateTime(TIMEs times);
}

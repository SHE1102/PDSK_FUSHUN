package com.pdsk.service;

import com.pdsk.domain.TIMEs;

/**
 * Created by Administrator on 2020/2/12 0012.
 */
public interface PeriodLengthService {
    TIMEs findTime();
    boolean updateTime(TIMEs time);
}

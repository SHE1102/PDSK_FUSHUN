package com.pdsk.service.impl;

import com.pdsk.dao.PeriodLengthDao;
import com.pdsk.domain.TIMEs;
import com.pdsk.service.PeriodLengthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2020/2/12 0012.
 */
@Service
public class PeriodLengthServiceImpl implements PeriodLengthService {

    @Autowired
    private PeriodLengthDao periodLengthDao;

    @Override
    public TIMEs findTime() {
        return periodLengthDao.findTime();
    }

    @Override
    public boolean updateTime(TIMEs time) {
        return periodLengthDao.updateTime(time);
    }
}

package com.air.service.common;

import com.air.dao.common.SequenceDao;
import com.air.pojo.common.Sequence;
import com.air.service.AirAutowired;

import java.sql.SQLException;

/**
 * create at: 11-8-28
 *
 * @author Yonghui Chen
 */
public class SequenceService {
    @AirAutowired
    SequenceDao sequenceDao;

    public synchronized long getNextId(String seqName) throws SQLException {
        // 暂时不考虑同步问题
        Sequence sequence = sequenceDao.get(seqName);
        if (sequence == null) {
            sequence = new Sequence();
            sequence.setId(seqName);
            sequence.setCurVal(2);
            sequenceDao.insert(sequence);
            return 1;
        } else {
            sequence.setCurVal(sequence.getCurVal() + 1);
            sequenceDao.update(sequence);
            return sequence.getCurVal() - 1;
        }
    }
}

package com.pdsk.service.impl;

import com.pdsk.dao.ContentEditorDao;
import com.pdsk.domain.Txt;
import com.pdsk.service.ContentEditorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2020/2/13 0013.
 */
@Service
public class ContentEditorServiceImpl implements ContentEditorService {

    @Autowired
    private ContentEditorDao contentEditorDao;

    @Override
    public Integer getRecordCount() {
        return contentEditorDao.getRecordCount();
    }

    @Override
    public Txt findTxtRecord() {
        return contentEditorDao.findTxtRecord();
    }

    @Override
    public boolean insertTxt(String txt) {
        return contentEditorDao.insertTxt(txt);
    }

    @Override
    public boolean insertInstructions(String instructions) {
        return contentEditorDao.insertInstructions(instructions);
    }

    @Override
    public boolean updateTxtById(String id, String txt) {
        return contentEditorDao.updateTxtById(id,txt);
    }

    @Override
    public boolean updateInstructionsById(String id, String instructions) {
        return contentEditorDao.updateInstructionsById(id,instructions);
    }
}

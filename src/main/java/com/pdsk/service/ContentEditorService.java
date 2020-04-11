package com.pdsk.service;

import com.pdsk.domain.Txt;

/**
 * Created by Administrator on 2020/2/13 0013.
 */
public interface ContentEditorService {
    Integer getRecordCount();
    Txt findTxtRecord();
    boolean insertTxt(String txt);
    boolean insertInstructions(String instructions);
    boolean updateTxtById(String id, String txt);
    boolean updateInstructionsById(String id, String instructions);
}

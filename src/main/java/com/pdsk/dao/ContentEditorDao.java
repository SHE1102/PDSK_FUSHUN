package com.pdsk.dao;

import com.pdsk.domain.Txt;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2020/2/13 0013.
 */
@Repository
public interface ContentEditorDao {
    Integer getRecordCount();
    Txt findTxtRecord();
    boolean insertTxt(@Param("txt") String txt);
    boolean insertInstructions(@Param("instructions") String instructions);
    boolean updateTxtById(@Param("id") String id, @Param("txt") String txt);
    boolean updateInstructionsById(@Param("id") String id, @Param("instructions") String instructions);
}

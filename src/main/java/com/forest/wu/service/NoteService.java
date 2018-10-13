package com.forest.wu.service;

import com.forest.wu.pojo.Note;

import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author 任一
 * @create 2018-10-10 17:22
 **/
public interface NoteService {

    /**
     *
     * @author: 任一
     * @Description 根据用户Id查询五条时间最近的信息
     * @Date: 17:18 2018/10/10
     * @Param：
     * @return：
     */
    List<Note> getNoteSelf(Integer clientId);

    /**
     *
     * @author: 任一
     * @Description 查询未读的邮件数
     * @Date: 16:46 2018/10/11
     * @Param：
     * @return：
     */
    Integer noReadCount( Integer clientId);

    /**
     *
     * @author: 任一
     * @Description 把未读改为已读
     * @Date: 17:05 2018/10/11
     * @Param：
     * @return：
     */
    boolean readDone(Integer clientId);

    /**
     *
     * @author: 任一
     * @Description 根据用户id返回用户所有信息
     * @Date: 9:35 2018/10/12
     * @Param：
     * @return：
     */
    List<Note> getAllSelf(Integer clientId);
}

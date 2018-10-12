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
}

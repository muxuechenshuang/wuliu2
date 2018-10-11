package com.forest.wu.dao;

import com.forest.wu.pojo.Note;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Note record);

    int insertSelective(Note record);

    Note selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Note record);

    int updateByPrimaryKey(Note record);

    /**
     *
     * @author: 任一
     * @Description 根据用户Id查询五条时间最近的信息
     * @Date: 17:18 2018/10/10
     * @Param：
     * @return：
     */
    List<Note> getNoteSelf(@Param(value = "clientId") Integer clientId);
}
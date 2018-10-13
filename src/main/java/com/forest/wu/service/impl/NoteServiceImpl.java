package com.forest.wu.service.impl;

import com.forest.wu.dao.NoteMapper;
import com.forest.wu.pojo.Note;
import com.forest.wu.service.NoteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author 任一
 * @create 2018-10-10 17:23
 **/
@Service
public class NoteServiceImpl implements NoteService {
    @Resource
    private NoteMapper noteMapper;

    @Override
    public List<Note> getNoteSelf(Integer clientId) {
        return noteMapper.getNoteSelf(clientId);
    }

    /**
     *
     * @author: 任一
     * @Description 查询未读的邮件数
     * @Date: 16:46 2018/10/11
     * @Param：
     * @return：
     */
    @Override
    public Integer noReadCount(Integer clientId){
        return noteMapper.noReadCount(clientId);
    }

    /**
     *
     * @author: 任一
     * @Description 把未读改为已读
     * @Date: 17:05 2018/10/11
     * @Param：
     * @return：
     */
    @Override
    public boolean readDone(Integer clientId){
        boolean flag = false;
        if(noteMapper.readDone(clientId) > 0){
            flag = true;
        }
        return flag;
    }

    /**
     *
     * @author: 任一
     * @Description 根据用户id返回用户所有信息
     * @Date: 9:35 2018/10/12
     * @Param：
     * @return：
     */
    @Override
    public List<Note> getAllSelf(Integer clientId){
        return noteMapper.getAllSelf(clientId);
    }
}

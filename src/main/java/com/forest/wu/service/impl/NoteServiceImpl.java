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
}

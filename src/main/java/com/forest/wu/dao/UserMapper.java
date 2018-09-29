package com.forest.wu.dao;

import com.forest.wu.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    /*
    * @author:李普强
    * @Description描述：
    * @Date: 10:24 2018/9/29
    * @Param参数：
    * @return返回值：
    **/
    List<User> selectU();
}
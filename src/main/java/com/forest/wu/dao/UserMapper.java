package com.forest.wu.dao;

import com.forest.wu.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import sun.awt.SunHints;

import java.util.List;


@Repository
public interface UserMapper {
   /* int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);*/

    /*
    * @author:李普强
    * @Description描述：用户输入的条件查询出对应的快递员信息，并分页
    * @Date: 10:24 2018/9/29
    * @Param参数：快递员编号 ，名字，手机，邮箱，当前页，页大小
    * @return返回值：快递员对象集合
    **/
    List<User> selectUser(@Param(value = "id") String id,
                          @Param(value = "username") String username,
                          @Param(value = "phone") String phone,
                          @Param(value = "email") String email,
                          @Param(value = "pageNo") Integer pageNo,
                          @Param(value = "pageSize") Integer pageSize);
    /*
    * @author:李普强
    * @Description描述：根据条件查询对应快递员的count记录数
    * @Date: 16:20 2018/9/29
    * @Param参数：快递员编号，名字，手机，邮箱
    * @return返回值：int
    **/
    public int count(@Param(value = "id") String id ,
                     @Param(value = "username") String username,
                     @Param(value = "phone") String phone,
                     @Param(value = "email") String email);
}
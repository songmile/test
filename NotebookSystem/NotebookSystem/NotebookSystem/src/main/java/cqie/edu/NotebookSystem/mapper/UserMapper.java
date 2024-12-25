package cqie.edu.NotebookSystem.mapper;

import cqie.edu.NotebookSystem.domain.User;
import cqie.edu.NotebookSystem.domain.qo.UserQo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    // 查询符合条件的全部实体
    List<User> list(UserQo qo);

    // 新增实体
    int insert(User mo);

    // 修改实体
    int update(User mo);

    // 根据主键删除实体
    int deleteById(int id);

    // 根据主键获取实体
    User getById(int id);

    // 根据account获取实体，用于判断account是否存在，以控制account不允许重复
    User getByAccount(@Param("account") String account, @Param("id") Integer id);

    // 登录验证
    User checkLogin(@Param("account") String account, @Param("password") String password);
}

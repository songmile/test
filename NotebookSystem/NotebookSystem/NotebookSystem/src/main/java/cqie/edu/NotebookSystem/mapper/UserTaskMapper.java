package cqie.edu.NotebookSystem.mapper;

import cqie.edu.NotebookSystem.domain.UserTask;
import cqie.edu.NotebookSystem.domain.qo.UserTaskQo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserTaskMapper {
    // 查询符合条件的全部实体
    List<UserTask> list(UserTaskQo qo);

    // 新增实体
    int insert(UserTask mo);

    // 修改实体
    int update(UserTask mo);

    // 根据主键删除实体
    int deleteById(int id);

    // 根据主键获取实体
    UserTask getById(int id);
}

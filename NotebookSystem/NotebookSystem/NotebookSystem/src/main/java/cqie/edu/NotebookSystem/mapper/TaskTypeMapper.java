package cqie.edu.NotebookSystem.mapper;

import cqie.edu.NotebookSystem.domain.TaskType;
import cqie.edu.NotebookSystem.domain.qo.TaskTypeQo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaskTypeMapper {
    // 查询全部实体
    List<TaskType> list(TaskTypeQo qo);

    // 新增实体
    int insert(TaskType mo);

    // 修改实体
    int update(TaskType mo);

    // 根据主键删除实体
    int deleteById(int id);

    // 根据主键获取实体
    TaskType getById(int id);

    // 根据name获取实体，用于判断name是否存在，以控制name不允许重复
    TaskType getByName(@Param("name") String name, @Param("id") Integer id);
}

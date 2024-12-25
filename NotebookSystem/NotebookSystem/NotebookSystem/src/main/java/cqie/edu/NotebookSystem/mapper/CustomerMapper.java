package cqie.edu.NotebookSystem.mapper;

import cqie.edu.NotebookSystem.domain.Customer;
import cqie.edu.NotebookSystem.domain.qo.CustomerQo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerMapper {
    // 查询符合条件的全部实体
    List<Customer> list(CustomerQo qo);

    // 新增实体
    int insert(Customer mo);

    // 修改实体
    int update(Customer mo);

    // 根据主键删除实体
    int deleteById(int id);

    // 根据主键获取实体
    Customer getById(int id);

    // 根据userId获取实体
    Customer getByUserId(int userId);

    // 根据name获取实体，不包含id指定行
    Customer getByName(@Param("name") String name, @Param("id") Integer id);

    int getByAge(@Param("startTime") String startTime, @Param("endTime") String endTime);
}

package cqie.edu.NotebookSystem.domain.qo;

import lombok.Data;

//用户列表的查询条件
@Data
public class UserQo {
    private String name;//用户名-模糊查询
}

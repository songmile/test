package cqie.edu.NotebookSystem.domain.qo;

import lombok.Data;

@Data
public class TaskTypeQo {
    private String name;//分类名称-模糊查询
    private String code;//分类代码
}

package cqie.edu.NotebookSystem.domain;

import lombok.Data;

/**
 * 描述: 事件分类实体类 映射task_type
 */
@Data
public class TaskType {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 分类名称
     */
    private String name;
    /**
     * 分类代码
     */
    private String code;
    /**
     * 顺序号
     */
    private Integer sortCode;
}

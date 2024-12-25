package cqie.edu.NotebookSystem.domain;

import lombok.Data;

/**
 * 描述: 用户事件实体类 映射task_type
 */
@Data
public class UserTask {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 隶属用户Id
     */
    private Integer userId;
    /**
     * 事件分类Id
     */
    private Integer taskTypeId;
    /**
     * 事件标题
     */
    private String title;
    /**
     * 事件内容
     */
    private String content;
    /**
     * 起始日期
     */
    private String startDate;
    /**
     * 截止日期
     */
    private String endDate;
    /**
     * 事件级别(1-一般 2-重要 3-紧急）
     */
    private int level;
    /**
     * 状态（1-未完成 2-已完成 9-作废）
     */
    private int status;
}

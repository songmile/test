package cqie.edu.NotebookSystem.domain.qo;

import lombok.Data;

@Data
public class UserTaskQo {
    /**
     * 隶属用户Id
     * 前端不传值，后端确定
     * 当前登录用户为管理员时，值为null,查询全部用户
     * 否则是当前登录用户的Id
     */
    private Integer userId;
    /**
     * 事件分类Id
     */
    private Integer taskTypeId;
    /**
     * 事件标题-模糊查询
     */
    private String title;
    /**
     * 事件级别(1-一般 2-重要 3-紧急）
     */
    private Integer level;
    /**
     * 状态（1-未完成 2-已完成 9-作废）
     */
    private Integer status;
}

package cqie.edu.NotebookSystem.domain.vo;

import cqie.edu.NotebookSystem.domain.Customer;
import cqie.edu.NotebookSystem.domain.User;
import cqie.edu.NotebookSystem.domain.UserTask;
import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public class UserTaskVo extends UserTask {
    private User user;//隶属用户
    private Customer customer;//绑定客户(隶属用户为null时，值为null)
    private String taskTypeName;//事件类型显示值
    private String levelName;//事件级别显示值
    private String statusName;//状态显示值
}

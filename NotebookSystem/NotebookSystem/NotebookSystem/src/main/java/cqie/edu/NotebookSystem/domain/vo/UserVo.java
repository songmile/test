package cqie.edu.NotebookSystem.domain.vo;

import cqie.edu.NotebookSystem.domain.User;
import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public class UserVo extends User {
    private String statusName;//状态显示值
}

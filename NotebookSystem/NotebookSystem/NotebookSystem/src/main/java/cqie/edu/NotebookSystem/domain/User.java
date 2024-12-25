package cqie.edu.NotebookSystem.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 描述: 用户实体类 映射sys_user
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 用户名
     */
    private String name;
    /**
     * 登录账号
     */
    private String account;
    /**
     * 登录密码
     */
    private String password;
    /**
     * 状态
     * 0-正常
     * 1-禁用
     */
    private Integer status;
}

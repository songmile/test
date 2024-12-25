package cqie.edu.NotebookSystem.domain.po;

import lombok.Data;

@Data
public class CustomerRegPO {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 绑定用户Id
     */
    private Integer userId;
    /**
     * 姓名
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
     * 出生日期
     */
    private String birthday;
    /**
     * 手机号
     */
    private String mobile;
    /**
     * 邮箱
     */
    private String email;
}

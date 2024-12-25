package cqie.edu.NotebookSystem.domain;

import lombok.Data;

/**
 * 描述: 客户信息实体类 映射customer
 */
@Data
public class Customer {
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
    /**
     * 注册时间
     */
    private String regTime;
}

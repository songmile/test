package cqie.edu.NotebookSystem.domain.qo;

import lombok.Data;

@Data
public class CustomerQo {
    private String name;//姓名-模糊查询
    private String mobile;//电话
    private Integer age;//年龄
    private String regTimeStart;//注册时间范围-开始
    private String regTimeEnd;//注册时间范围-截至
}

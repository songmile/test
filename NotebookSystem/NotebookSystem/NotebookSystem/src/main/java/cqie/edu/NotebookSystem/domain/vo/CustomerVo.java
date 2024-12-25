package cqie.edu.NotebookSystem.domain.vo;

import cqie.edu.NotebookSystem.domain.Customer;
import cqie.edu.NotebookSystem.domain.User;
import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public class CustomerVo extends Customer {
    private User user;//隶属用户
}

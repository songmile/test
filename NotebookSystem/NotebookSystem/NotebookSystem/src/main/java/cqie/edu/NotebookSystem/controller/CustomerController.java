package cqie.edu.NotebookSystem.controller;

import com.github.pagehelper.PageInfo;
import cqie.edu.NotebookSystem.comm.PageQo;
import cqie.edu.NotebookSystem.comm.RetJson;
import cqie.edu.NotebookSystem.domain.Customer;
import cqie.edu.NotebookSystem.domain.User;
import cqie.edu.NotebookSystem.domain.po.CustomerRegPO;
import cqie.edu.NotebookSystem.domain.qo.CustomerQo;
import cqie.edu.NotebookSystem.domain.vo.CustomerVo;
import cqie.edu.NotebookSystem.service.CustomerService;
import cqie.edu.NotebookSystem.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService userService;

    // 分页查询
    @PostMapping(value = "/paged")
    @ResponseBody
    public Object paged(@RequestBody PageQo<CustomerQo> qo){
        try {
            PageInfo<CustomerVo> paged = customerService.paged(qo);
            return new RetJson(200,null,paged);
        }catch (Exception e){
            return new RetJson(-1,e.getMessage(),null);
        }
    }

    //新增与修改的Post
    @PostMapping(value="/save")
    @ResponseBody
    public Object save(@RequestBody CustomerRegPO po) {
        try {
            if(customerService.existName(po.getName(),po.getId())){
                return new RetJson(-1,"客户姓名已经存在",null);
            }
            if(userService.existAccount(po.getAccount(),po.getUserId())){
                return new RetJson(-1,"登录账号已经存在",null);
            }
            Customer mo = new Customer();
            BeanUtils.copyProperties(po, mo);
            if (po.getId() == null) {//注册
                //1.先增加用户
                User user = new User();
                user.setName(po.getName());
                user.setAccount(po.getAccount());
                user.setPassword(po.getPassword());
                user.setStatus(0);
                userService.insert(user);//Insert的SQL配置需配属性useGeneratedKeys=true与keyProperty=主键Id,才能返回自增Id值
                //2.再增加客户
                mo.setUserId(user.getId());//绑定用户Id
                //注册时间
                Date now = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                mo.setRegTime(sdf.format(now));

                customerService.insert(mo);
            }else{//修改
                customerService.update(mo);
            }
            return new RetJson(200,null,null);
        } catch (Exception e) {
            return new RetJson(-1,e.getMessage(),null);
        }
    }
    //删除Get
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public Object delete(@PathVariable("id") Integer id){
        try {
            customerService.deleteById(id);
            return new RetJson(200,null,null);
        } catch (Exception e) {
            return new RetJson(-1,e.getMessage(),null);
        }
    }

    //打开客户管理页面-分页列表
    @GetMapping("/list")
    public String list() {
        return "customer/list";
    }
    //打开客户注册页面
    @GetMapping("/reg")
    public String reg() {
        return "customer/reg";
    }
}
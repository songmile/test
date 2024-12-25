package cqie.edu.NotebookSystem.controller;

import com.github.pagehelper.PageInfo;
import cqie.edu.NotebookSystem.comm.PageQo;
import cqie.edu.NotebookSystem.comm.RetJson;
import cqie.edu.NotebookSystem.domain.SysMenu;
import cqie.edu.NotebookSystem.domain.User;
import cqie.edu.NotebookSystem.domain.qo.UserQo;
import cqie.edu.NotebookSystem.domain.vo.UserVo;
import cqie.edu.NotebookSystem.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    // 分页查询
    @PostMapping(value = "/paged")
    @ResponseBody
    public Object paged(@RequestBody PageQo<UserQo> qo){
        try {
            PageInfo<UserVo> paged = userService.paged(qo);
            return new RetJson(200,null,paged);
        }catch (Exception e){
            return new RetJson(-1,e.getMessage(),null);
        }
    }

    //新增与修改的Post
    @PostMapping(value="/save")
    @ResponseBody
    public Object save(@RequestBody User mo) {
        try {
            if(userService.existAccount(mo.getAccount(),mo.getId())){
                return new RetJson(-1,"登录账号已经存在",null);
            }
            if (mo.getId() == null) {
                userService.insert(mo);
            }else{
                userService.update(mo);
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
            userService.deleteById(id);
            return new RetJson(200,null,null);
        } catch (Exception e) {
            return new RetJson(-1,e.getMessage(),null);
        }
    }
    // 登录验证
    @PostMapping(value = "/login")
    @ResponseBody
    public Object login(@RequestBody User user, HttpSession session) {
        try {
            User loginUser = userService.checkLogin(user.getAccount(), user.getPassword());
            if (loginUser != null) {
                session.setAttribute("loginUser", loginUser);
                return new RetJson(200, null, loginUser);
            }
            return new RetJson(-1, "账号或密码错误", null);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return new RetJson(-1, "登录异常", null);
        }
    }

    // 获取当前登录用户的菜单权限
    @GetMapping(value = "/listMenuAuth")
    @ResponseBody
    public Object listMenuAuth(HttpSession session) {
        //1.确定当前登录用户
        if (session.getAttribute("loginUser") == null) {
            return new RetJson(-1, "未登录或登录过期", null);
        }
        User loginUser = (User) session.getAttribute("loginUser");
        //2.确定当前登录用户的菜单权限
        List<String> adminRoleList= Arrays.asList("admin","fxm");//采用登录账号识别角色
        List<SysMenu> menuAuth = new ArrayList<>();
        if (adminRoleList.contains(loginUser.getAccount())) {
            menuAuth.add(new SysMenu(100, "系统管理", "", 10, null));
            menuAuth.add(new SysMenu(101, "用户管理", "user/list", 10, 100));
            menuAuth.add(new SysMenu(102, "客户管理", "customer/list", 20, 100));
            menuAuth.add(new SysMenu(103, "事件类型管理", "taskType/list", 30, 100));
        }
        menuAuth.add(new SysMenu(200, "业务管理", "", 20, null));
        menuAuth.add(new SysMenu(201, "事件管理", "userTask/list", 10, 200));
        menuAuth.add(new SysMenu(300, "关于", "home/about", 30, null));
        //3.返回值
        return new RetJson(200, null, menuAuth);
    }

    //打开登录页面
    @GetMapping("/login")
    public String login() {
        return "user/login";
    }
    // 退出登录
    @GetMapping(value = "/logout")
    public String Logout(HttpSession session) {
        // 清除登录信息
        session.invalidate();
        return "user/login";
    }
    //打开用户管理页面-分页列表
    @GetMapping("/list")
    public String list() {
        return "user/list";
    }

    @GetMapping("/getCurrentUser")
    @ResponseBody
    public RetJson getCurrentUser(HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser == null) {
            return new RetJson(-1, "用户未登录", null);
        }
        return new RetJson(200, null, loginUser);
    }
}
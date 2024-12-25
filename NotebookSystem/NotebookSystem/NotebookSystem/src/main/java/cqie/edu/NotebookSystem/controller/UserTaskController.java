package cqie.edu.NotebookSystem.controller;

import com.github.pagehelper.PageInfo;
import cqie.edu.NotebookSystem.comm.PageQo;
import cqie.edu.NotebookSystem.comm.RetJson;
import cqie.edu.NotebookSystem.domain.User;
import cqie.edu.NotebookSystem.domain.UserTask;
import cqie.edu.NotebookSystem.domain.qo.UserTaskQo;
import cqie.edu.NotebookSystem.domain.vo.UserTaskVo;
import cqie.edu.NotebookSystem.service.TaskTypeService;
import cqie.edu.NotebookSystem.service.UserTaskService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/userTask")
public class UserTaskController {
    @Autowired
    private UserTaskService userTaskService;
    @Autowired
    private TaskTypeService taskTypeService;
    // 分页查询
    @PostMapping(value = "/paged")
    @ResponseBody
    public Object paged(@RequestBody PageQo<UserTaskQo> qo, HttpSession session) {
        try {
            User loginUser = (User) session.getAttribute("loginUser");
            if (!loginUser.getAccount().equals("admin")) {
                UserTaskQo filters = qo.getFilters();
                filters.setUserId(loginUser.getId());
                qo.setFilters(filters);
            }
            PageInfo<UserTaskVo> paged = userTaskService.paged(qo);
            return new RetJson(200, null, paged);
        } catch (Exception e) {
            return new RetJson(-1, e.getMessage(), null);
        }
    }
    //新增与修改的Post
    @PostMapping(value="/save")
    @ResponseBody
    public Object save(@RequestBody UserTask mo, HttpSession session) {
        try {
            User loginUser = (User) session.getAttribute("loginUser");
            if (loginUser == null) {
                return new RetJson(-1, "用户未登录", null);
            }
            mo.setUserId(loginUser.getId()); // 设置当前用户ID
            if (mo.getId() == null) {
                userTaskService.insert(mo);
            } else {
                userTaskService.update(mo);
            }
            return new RetJson(200, null, null);
        } catch (Exception e) {
            return new RetJson(-1, e.getMessage(), null);
        }
    }
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public Object delete(@PathVariable("id") Integer id) {
        try {
            userTaskService.deleteById(id);
            return new RetJson(200, null, null);
        } catch (Exception e) {
            return new RetJson(-1, e.getMessage(), null);
        }
    }
    //打开用户管理页面-分页列表
    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("taskTypeOptions",taskTypeService.listOptions());
        model.addAttribute("levelOptions",userTaskService.listOptionsForLevel());
        model.addAttribute("statusOptions",userTaskService.listOptionsForStatus());
        return "userTask/list";
    }
}

package cqie.edu.NotebookSystem.controller;

import com.github.pagehelper.PageInfo;
import cqie.edu.NotebookSystem.comm.PageQo;
import cqie.edu.NotebookSystem.comm.RetJson;
import cqie.edu.NotebookSystem.domain.TaskType;
import cqie.edu.NotebookSystem.domain.qo.TaskTypeQo;
import cqie.edu.NotebookSystem.domain.vo.TaskTypeVo;
import cqie.edu.NotebookSystem.service.TaskTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/taskType")
public class TaskTypeController {
    @Autowired
    private TaskTypeService taskTypeService;

    // 分页查询
    @PostMapping(value = "/paged")
    @ResponseBody
    public Object paged(@RequestBody PageQo<TaskTypeQo> qo){
        try {
            PageInfo<TaskTypeVo> paged = taskTypeService.paged(qo);
            return new RetJson(200,null,paged);
        }catch (Exception e){
            return new RetJson(-1,e.getMessage(),null);
        }
    }

    //新增与修改的Post
    @PostMapping(value="/save")
    @ResponseBody
    public Object save(@RequestBody TaskType mo) {
        try {
            if(taskTypeService.existName(mo.getName(),mo.getId())){
                return new RetJson(-1,"分类名称已经存在",null);
            }
            if (mo.getId() == null) {
                taskTypeService.insert(mo);
            }else{
                taskTypeService.update(mo);
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
            taskTypeService.deleteById(id);
            return new RetJson(200,null,null);
        } catch (Exception e) {
            return new RetJson(-1,e.getMessage(),null);
        }
    }
    //打开任务类型管理页面-分页列表
    @GetMapping("/list")
    public String list() {
        return "taskType/list";
    }
}
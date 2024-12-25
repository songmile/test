package cqie.edu.NotebookSystem.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cqie.edu.NotebookSystem.comm.PageQo;
import cqie.edu.NotebookSystem.comm.SelectListItem;
import cqie.edu.NotebookSystem.domain.TaskType;
import cqie.edu.NotebookSystem.domain.qo.TaskTypeQo;
import cqie.edu.NotebookSystem.domain.vo.TaskTypeVo;
import cqie.edu.NotebookSystem.mapper.TaskTypeMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TaskTypeService {
    @Autowired
    private TaskTypeMapper taskTypeMapper;

    //分页查询符合条件的实体
    public PageInfo<TaskTypeVo> paged(PageQo<TaskTypeQo> pageQo) {
        PageHelper.startPage(pageQo.getPageIndex(), pageQo.getPageSize());
        List<TaskType> mos = taskTypeMapper.list(pageQo.getFilters());
        if (mos == null) return null;
        PageInfo<TaskType> moPageInfo = new PageInfo<>(mos);
        PageInfo<TaskTypeVo> voPageInfo = new PageInfo<>();
        BeanUtils.copyProperties(moPageInfo, voPageInfo);
        List<TaskTypeVo> vos = new ArrayList<>();
        for (TaskType mo : mos) {
            TaskTypeVo vo = new TaskTypeVo();
            BeanUtils.copyProperties(mo, vo);
            vos.add(vo);
        }
        voPageInfo.setList(vos);
        return voPageInfo;
    }

    // 新增实体
    public int insert(TaskType mo) {
        return taskTypeMapper.insert(mo);
    }

    // 修改实体
    public int update(TaskType mo) {
        return taskTypeMapper.update(mo);
    }

    // 根据主键删除实体
    public int deleteById(int id) {
        return taskTypeMapper.deleteById(id);
    }

    // 根据主键获取实体
    public TaskTypeVo getById(int id) {
        TaskType mo = taskTypeMapper.getById(id);
        if(mo == null){
            return null;
        }
        TaskTypeVo vo = new TaskTypeVo();
        BeanUtils.copyProperties(mo, vo);
        return vo;
    }

    // 指定名称的实体是否已经存在
    public boolean existName(String name, Integer id) {
        TaskType mo = taskTypeMapper.getByName(name, id);
        return mo != null;
    }

    //事件分类备选项
    public List<SelectListItem> listOptions(){
        List<SelectListItem> list = new ArrayList<>();
        TaskTypeQo qo = new TaskTypeQo();
        List<TaskType> mos = taskTypeMapper.list(qo);
        for (TaskType mo : mos) {
            SelectListItem item = new SelectListItem();
            item.setText(mo.getName());
            item.setValue(mo.getId().toString());
            list.add(item);
        }
        System.out.println(list);
        return list;
    }
}

package cqie.edu.NotebookSystem.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cqie.edu.NotebookSystem.comm.PageQo;
import cqie.edu.NotebookSystem.comm.SelectListItem;
import cqie.edu.NotebookSystem.domain.UserTask;
import cqie.edu.NotebookSystem.domain.qo.UserTaskQo;
import cqie.edu.NotebookSystem.domain.vo.UserTaskVo;
import cqie.edu.NotebookSystem.mapper.UserTaskMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserTaskService {
    @Autowired
    private UserTaskMapper userTaskMapper;
    @Autowired
    private UserService userService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private TaskTypeService taskTypeService;
    //分页查询符合条件的实体
    public PageInfo<UserTaskVo> paged(PageQo<UserTaskQo> pageQo) {
        PageHelper.startPage(pageQo.getPageIndex(), pageQo.getPageSize());
        List<UserTask> mos = userTaskMapper.list(pageQo.getFilters());
        if (mos == null) return null;
        PageInfo<UserTask> moPageInfo = new PageInfo<>(mos);
        PageInfo<UserTaskVo> voPageInfo = new PageInfo<>();
        BeanUtils.copyProperties(moPageInfo, voPageInfo);
        List<UserTaskVo> vos = new ArrayList<>();
        for (UserTask mo : mos) {
            UserTaskVo vo = new UserTaskVo();
            BeanUtils.copyProperties(mo, vo);
            if (mo.getUserId() != null) {
                //映射-绑定用户
                vo.setUser(userService.getById(mo.getUserId()));
                //映射-事件记录人客户
                vo.setCustomer(customerService.getByUserId(mo.getUserId()));
            }
            if(mo.getTaskTypeId() != null) {
                //映射-事件分类
                vo.setTaskTypeName(taskTypeService.getById(mo.getTaskTypeId()).getName());
            }
            //映射-状态
            vo.setStatusName(mapNameByStatus(mo.getStatus()));
            //映射-事件级别
            vo.setLevelName(mapNameByLevel(mo.getLevel()));
            vos.add(vo);
        }
        voPageInfo.setList(vos);
        return voPageInfo;
    }

    // 新增实体
    @Transactional
    public int insert(UserTask mo) {
        // 检查必需字段是否已设置
        if (mo.getUserId() == null || mo.getTaskTypeId() == null || mo.getTitle() == null) {
            throw new IllegalArgumentException("必需字段未设置");
        }
        return userTaskMapper.insert(mo);
    }

    // 修改实体
    public int update(UserTask mo) {
        return userTaskMapper.update(mo);
    }

    // 根据主键删除实体
    public int deleteById(int id) {
        return userTaskMapper.deleteById(id);
    }

    // 根据主键获取实体
    public UserTaskVo getById(int id) {
        UserTask mo = userTaskMapper.getById(id);
        UserTaskVo vo = new UserTaskVo();
        BeanUtils.copyProperties(mo, vo);
        if (mo.getUserId() != null) {
            //映射-绑定用户
            vo.setUser(userService.getById(mo.getUserId()));
            //映射-事件记录人客户
            vo.setCustomer(customerService.getByUserId(mo.getUserId()));
        }
        if(mo.getTaskTypeId() != null) {
            //映射-事件分类
            vo.setTaskTypeName(taskTypeService.getById(mo.getTaskTypeId()).getName());
        }
        //映射-状态
        vo.setStatusName(mapNameByStatus(mo.getStatus()));
        //映射-事件级别
        vo.setLevelName(mapNameByLevel(mo.getLevel()));
        return vo;
    }
    //根据状态值映射状态名称
    public String mapNameByStatus(Integer val){
        if(val==null) return null;
        if(val==1) return  "未完成";
        if(val==2) return  "已完成";
        if(val==9) return  "作废";
        return "状态值错误";
    }
    //根据级别值映射级别名称
    public String mapNameByLevel(Integer val){
        if(val==null) return null;
        if(val==1) return  "一般";
        if(val==2) return  "重要";
        if(val==9) return  "紧急";
        return "事件状态值错误";
    }
    //状态备选项
    public List<SelectListItem> listOptionsForStatus(){
        List<SelectListItem> list = new ArrayList<>();
        list.add(new SelectListItem("未完成","1"));
        list.add(new SelectListItem("已完成","2"));
        list.add(new SelectListItem("作废","9"));
        return list;
    }
    //事件级别备选项
    public List<SelectListItem> listOptionsForLevel(){
        List<SelectListItem> list = new ArrayList<>();
        list.add(new SelectListItem("一般","1"));
        list.add(new SelectListItem("重要","2"));
        list.add(new SelectListItem("紧急","9"));
        return list;
    }
}
